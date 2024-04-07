terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.44.0"
    }
  }
  backend "s3" {
    bucket = "cloud-infraestrutura-aws-tfstate"
    key    = "modulo/ecr/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
   region = "us-east-1"
  default_tags {
    tags = {
      Environment = "hml"
      Managed-by  = "Terraform"
      Project     = "LAB-Globo"
      CostCenter  = "cc-001"
    }
  }
}