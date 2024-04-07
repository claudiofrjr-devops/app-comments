terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.44.0"
    }
    random  = {
      source  = "hashicorp/random"
      version = "3.6.0"
    }
  }
  backend "s3" {
    bucket = "cloud-infraestrutura-aws-tfstate"
    key        = "modulo/ec2/terraform.tfstate"
    region  = "us-east-1"
  }
}

provider "aws" {
  default_tags {
    tags = {
      Environment = "hml"
      Managed-by  = "Terraform"
      Project            = "LAB-Globo"
      CostCenter    = "cc-001"
    }
  }
}

provider "random" {

}