output "vpc-id" {
  value = aws_vpc.dev_vpc.id
}

output "public-subnet-id" {
  value = aws_subnet.dev_public_subnet.id
}

output "private-subnet-id" {
  value = aws_subnet.dev_private_subnet.id
}   
