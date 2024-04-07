variable "image_tag" {
  description = "Modelo que será utilizado para ser ou nao substituido as imagens no repositorio"
  type              = string
  default         = "MUTABLE"
}

variable "repositorio_ecr" {
    description = "Nome referente ao repositorio de Imagens das aplicações"
    type              = string
    default         = "hml-lab-globo"
  
}
variable "environment" {
    description = "Ambinete que sera criado o repositorio ECR"
    type              = string
    default         = "hml"
  
}
variable "project" {
    description = "Projeto que sera usado o repositorio ECR"
    type              = string
    default        = "lab-globo"
  
}