variable "ami_image_instance" {
    description = "Imagem do Sistema Operacional disponibilizado pela AWS"
    type = string
    default = "ami-080e1f13689e07408"  
}
variable "instance_type" {
    description = "Modelo da instancia utilizada em relação ao poder computacional"
    type = string
    default = "t2.micro"
  
}
variable "ip_public" {
    description = "Validar se irá receber ip Publico ou não"
    type = bool
    default = true
}

variable "aws_region" {
    description = "Regiao que será aplicado o recurso"
    type = string
    default = "us-east-1"
  
}
variable "aws_account_id" {
    description = "conta AWS"
    type = string
    default = "058264399987"
  
}
variable "ecr_repository_url" {
    type = string
    default = "058264399987.dkr.ecr.us-east-1.amazonaws.com/hml-lab-globo:latest"  
}
variable "ecr_image_name" {
    type = string
    default = "hml-lab-globo:latest"
  
}
variable "policy_ecr" {
    type = string
    default = "arn:aws:iam::058264399987:policy/ECRAccessPolicy"
  
}
variable "environment" {
    type = string
    default = "hml"
  
}
###Variables VPC

   