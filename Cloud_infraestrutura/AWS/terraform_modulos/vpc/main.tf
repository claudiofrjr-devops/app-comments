##   VPC  ###
resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = "vpc-${var.environment}"
  }
}

#### Subnets Public #####
resource "aws_subnet" "public_01" {
  vpc_id     = aws_vpc.this.id
  cidr_block = var.cidr_subnet_public_01
  tags = {
    Name = "public-01-${var.environment}"
  }
}
resource "aws_subnet" "public_02" {
  vpc_id     = aws_vpc.this.id
  cidr_block = var.cidr_subnet_public_02
  tags = {
    Name = "public-02-${var.environment}"
  }
}
#####Subnets Private  #####
resource "aws_subnet" "private_01" {
  vpc_id     = aws_vpc.this.id
  cidr_block = var.cidr_subnet_private_01
  tags = {
    Name = "private-01-${var.environment}"
  }
}
resource "aws_subnet" "private_02" {
  vpc_id     = aws_vpc.this.id
  cidr_block = var.cidr_subnet_private_02
  tags = {
    Name = "private-02-${var.environment}"
  }
}
### Internet Gateway #####
resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id
  tags = {
    Name = "igw-${var.environment}"
  }
}

#### Tabela de Rotas  Publicas####
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }
  tags = {
    Name = "route-igw-${var.environment}"
  }
}
resource "aws_route_table_association" "rt_public__association-01" {
  subnet_id      = aws_subnet.public_01.id
  route_table_id = aws_route_table.public.id
}
resource "aws_route_table_association" "rt_public_association-02" {
  subnet_id      = aws_subnet.public_02.id
  route_table_id = aws_route_table.public.id
}

#### Tabela de Rotas Privadas #####
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.this.id
  tags = {
    Name = "route-${var.environment}"
  }
}
resource "aws_route_table_association" "rt_private_association-01" {
  subnet_id      = aws_subnet.private_01.id
  route_table_id = aws_route_table.private.id
}
resource "aws_route_table_association" "rt_private_association-02" {
  subnet_id      = aws_subnet.private_02.id
  route_table_id = aws_route_table.private.id
}

#####Security Group #####
resource "aws_security_group" "this" {
  name   = var.sg_01
  vpc_id = aws_vpc.this.id
  tags = {
    Name = "sg-${var.sg_01}"
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "HTTP"
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

