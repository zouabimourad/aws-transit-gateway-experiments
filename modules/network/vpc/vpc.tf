resource "aws_vpc" "self" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = var.name_prefix
  }
}

resource "aws_internet_gateway" "self" {
  vpc_id = aws_vpc.self.id
}