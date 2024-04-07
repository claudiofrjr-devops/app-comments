### Registry

resource "aws_ecr_repository" "this" {
    name = var.repositorio_ecr
    image_tag_mutability = var.image_tag
  
}

output "ecr_repository_url" {
  value = aws_ecr_repository.this.repository_url
}