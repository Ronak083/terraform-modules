resource "aws_vpc" "vpc" {
  cidr_block = var.cidr_block
  tags = {
    Name = var.name
  }
}

resource "aws_subnet" "public_subnet" {
  count             = var.subnet_count
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.public_subnets[count.index]
  availability_zone = var.azs[count.index]
  tags = {
    Name = "${var.name}-public-subnet-${count.index + 1}"
  }
}

resource "aws_subnet" "private_subnet" {
  count             = var.subnet_count
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.private_subnets[count.index]
  availability_zone = var.azs[count.index]
  tags = {
    Name = "${var.name}-private-subnet-${count.index + 1}"
  }
}
