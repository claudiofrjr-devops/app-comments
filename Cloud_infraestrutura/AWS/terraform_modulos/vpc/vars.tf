    variable "vpc_cidr_block" {
    description = "VPC Principal para a rede  com os recursos da aplicação de Comentarios"
    type              = string
    }

    variable "cidr_subnet_public_01" {
    description = "Subnet Public-01 com rota externa para acesso a Internet"
    type              = string
    }

    variable "cidr_subnet_public_02" {
    description = "Subnet Public-02 com rota externa para acesso a Internet"
    type              = string
    }

    variable "cidr_subnet_private_01" {
    description = "Subnet Private-01 com rota externa para acesso a Internet"
    type              = string
    }

    variable "cidr_subnet_private_02" {
    description = "Subnet Private-02 com rota externa para acesso a Internet"
    type              = string
    }

    variable "environment" {
    description = "Ambiente que será aplicado a configuração [dev, nprod, prod]"
    type              = string
    }

variable "sg_01" {
    description = "Regra para habilitar comunicação via portas pre-definidas"
    type              = string 
  
}