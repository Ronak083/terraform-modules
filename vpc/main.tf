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

resource "aws_db_subnet_group" "db_subnet_group" {
  count       = var.enable_db_subnet_group ? 1 : 0
  name        = "${var.name}-db-subnet-group"
  subnet_ids  = aws_subnet.private_subnet[*].id
  description = "DB subnet group for ${var.name}"
}

resource "aws_internet_gateway" "internet_gateway" {
  count  = var.enable_internet_gateway ? 1 : 0
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.name}-internet-gateway"
  }
}

resource "aws_nat_gateway" "nat_gateway" {
  count     = var.enable_nat_gateway ? 1 : 0
  subnet_id = aws_subnet.public_subnet[0].id
  tags = {
    Name = "${var.name}-nat-gateway"
  }
}

resource "aws_eip" "nat_gateway_eip" {
  count = var.enable_nat_gateway ? 1 : 0
}
