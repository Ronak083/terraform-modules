resource "aws_vpc" "vpc" {
  cidr_block = var.cidr_block
  tags = {
    Name = var.name
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.public_subnets[0]
  tags = {
    Name = "${var.name}-public-subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.private_subnets[0]
  tags = {
    Name = "${var.name}-private-subnet"
  }
}
