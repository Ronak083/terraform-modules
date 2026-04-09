# variable "public-subnet-id" {
#   description = "The ID of the public subnet"
#   type        = list(string)
# }

# variable "private-subnet-id" {
#   description = "The ID of the private subnet"
#   type        = list(string)
# }
# 
variable "cidr_block" {
  description = "The CIDR block of the VPC"
  type        = string
}

variable "name" {
  description = "The name of the VPC"
  type        = string
}

variable "azs" {
  description = "The list of Availability Zones"
  type        = list(string)
}

variable "public_subnets" {
  description = "The list of public subnets"
  type        = list(string)
}

variable "private_subnets" {
  description = "The list of private subnets"
  type        = list(string)
}

variable "enable_nat_gateway" {
  description = "Enable NAT Gateway"
  type        = bool
  default     = false
}

variable "enable_vpn_gateway" {
  description = "Enable VPN Gateway"
  type        = bool
  default     = false
}
