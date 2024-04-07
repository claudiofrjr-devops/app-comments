### Chamando Modulo Network
module "network" {
  source = "../vpc"  
     vpc_cidr_block                 =  "10.0.0.0/16"
    cidr_subnet_public_01   = "10.0.1.0/24"
    cidr_subnet_public_02   =  "10.0.2.0/24"
    cidr_subnet_private_01 = "10.0.3.0/24"
    cidr_subnet_private_02 = "10.0.4.0/24"
    environment                      = "hml"
    sg_01                                    = "app-comments-url"
}

resource "random_id" "ssh_key" {
  byte_length = 4
}

resource "aws_key_pair" "ssh_key" {
  key_name   = "temporary_ssh_key_${random_id.ssh_key.hex}"
  public_key  = tls_private_key.ssh_key.public_key_openssh
}
resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits     = 4096
}


resource "aws_instance" "this" {
    ami                                                =  var.ami_image_instance
    instance_type                            = var.instance_type
    key_name                                    = aws_key_pair.ssh_key.key_name
    vpc_security_group_ids          = module.network.security_group
    subnet_id                                     =  module.network.subnet_public_01
    associate_public_ip_address = var.ip_public
    iam_instance_profile                =  aws_iam_instance_profile.ecr_access_profile.name
    
    root_block_device {
    volume_type                    = "gp3" 
    volume_size                      = 15  
    delete_on_termination = true
  }

    tags       ={
       Name = "app-comentario-${var.environment}"
    }

user_data = <<-EOF
            #!/bin/bash
            sudo apt update -y
            sudo apt install -y curl unzip
            curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
            unzip awscliv2.zip
            sudo ./aws/install -i /usr/local/aws-cli -b /usr/local/bin
            curl -fsSL https://get.docker.com -o get-docker.sh
            sudo sh get-docker.sh
            sudo apt install -y docker.io
            sudo apt update -y && sudo apt upgrade -y
            sudo usermod -aG docker ubuntu
            sudo systemctl enable docker
            sudo systemctl start docker 
            aws ecr get-login-password --region ${var.aws_region} | docker login --username AWS --password-stdin ${var.aws_account_id}.dkr.ecr.${var.aws_region}.amazonaws.com
            docker pull ${var.ecr_repository_url}/${var.ecr_image_name}
            docker run -dti -p 8000:8080 --name api-comentario ${var.ecr_repository_url}/${var.ecr_image_name}
            EOF

}


###Politicas de Acesso ao ECR

resource "aws_iam_policy" "policy_ecr" {
  name   = "ECRAccessPolicy"
  policy  = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Action": [
          "ecr:GetAuthorizationToken",
          "ecr:BatchCheckLayerAvailability",
          "ecr:GetDownloadUrlForLayer",
          "ecr:GetRepositoryPolicy",
          "ecr:DescribeRepositories",
          "ecr:ListImages",
          "ecr:DescribeImages",
          "ecr:BatchGetImage"
        ],
        "Resource": "*"
      }
    ]
  })
}
resource "aws_iam_role" "role_ecr" {
  name                            = "ECRAccessRole"
  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement": [
      {
        "Effect"   : "Allow",
        "Principal": {
          "Service": "ec2.amazonaws.com"
        },
        "Action"   : "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ecr_access_attachment" {
  role             = aws_iam_role.role_ecr.name
  policy_arn = var.policy_ecr
}

resource "aws_iam_instance_profile" "ecr_access_profile" {
  name = "ECRAccessProfile"
  role    = aws_iam_role.role_ecr.name
}
