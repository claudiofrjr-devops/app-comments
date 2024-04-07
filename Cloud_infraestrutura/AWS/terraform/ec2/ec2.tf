module "ec2" {
  source    = "../../terraform_modulos/ec2"
  ami_image_instance  = var.ami_image_instance
  instance_type              = var.instance_type
  ip_public                        = var.ip_public
  aws_account_id           = var.aws_account_id
  aws_region                   = var.aws_region
  ecr_image_name        = var.ecr_image_name
  ecr_repository_url      = var.ecr_repository_url
}