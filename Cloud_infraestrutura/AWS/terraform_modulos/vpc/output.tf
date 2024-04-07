output "subnet_public_01" {
  value = aws_subnet.public_01.id
}
output "subnet_public_02" {
  value = aws_subnet.public_02.id
}
output "subnet_private_01" {
  value = aws_subnet.private_01.id
}
output "subnet_private_02" {
  value = aws_subnet.private_02.id
}

output "security_group" {
  value = aws_security_group.this.*.id
}