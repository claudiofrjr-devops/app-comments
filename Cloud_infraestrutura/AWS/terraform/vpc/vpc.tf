module "network" {
  source                 = "../../terraform_modulos/vpc"
  vpc_cidr_block         = "10.0.0.0/16"
  cidr_subnet_public_01  = "10.0.1.0/24"
  cidr_subnet_public_02  = "10.0.2.0/24"
  cidr_subnet_private_01 = "10.0.3.0/24"
  cidr_subnet_private_02 = "10.0.4.0/24"
  environment            = "hml"
  sg_01                  = "app-comments-url"
}