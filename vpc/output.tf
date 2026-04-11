output "vpc-id" {
  value = aws_vpc.vpc.id
}

output "public-subnet-ids" {
  value = aws_subnet.public_subnet[*].id
}

output "private-subnet-ids" {
  value = aws_subnet.private_subnet[*].id
}

output "db-subnet-group-id" {
  value = try(aws_db_subnet_group.db_subnet_group[0].id, "")
}

output "db-security-group-id" {
  value = try(aws_security_group.db_security_group[0].id, "")
}

output "internet-gateway-id" {
  value = try(aws_internet_gateway.internet_gateway[0].id, "")
}

output "nat-gateway-id" {
  value = try(aws_nat_gateway.nat_gateway[0].id, "")
}

output "nat-gateway-ip" {
  value = try(aws_nat_gateway.nat_gateway[0].public_ip, "")
}

output "nat-gateway-eip" {
  value = try(aws_eip.nat_gateway_eip[0].public_ip, "")
}
