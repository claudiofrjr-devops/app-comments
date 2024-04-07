    variable "vpc_cidr_block" {
    description = "VPC Principal para a rede  com os recursos da aplicação de Comentarios"
    type = string
    default = "10.0.0.0/16"
    }

    variable "cidr_subnet_public_01" {
    description = "Subnet Public-01 com rota externa para acesso a Internet"
    type = string
    default = "10.0.1.0/24"
    }

    variable "cidr_subnet_public_02" {
    description = "Subnet Public-02 com rota externa para acesso a Internet"
    type = string
    default = "10.0.2.0/24"
    }

    variable "cidr_subnet_private_01" {
    description = "Subnet Private-01 rota interna"
    type = string
    default = "10.0.3.0/24"
    }

    variable "cidr_subnet_private_02" {
    description = "Subnet Private-02 rota interna"
    type = string
    default = "10.0.4.0/24"
    }

    variable "environment" {
    description = "Ambiente que será aplicado a configuração [dev, nprod, prod]"
    type = string
    default = "hml"
    }


variable "sg_01" {
    description = "Regra para habilitar comunicação via portas pre-definidas"
    type = string 
   default =  "app-comments-url"

}