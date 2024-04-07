module "ecr" {
  source          = "../../terraform_modulos/ecr"
  repositorio_ecr = var.repositorio_ecr

}