variable "vpc_cidr" {
  description = "CIDR block for VPC"
}

variable "public_subnet_cidr" {
  description = "CIDR block for public subnet"
}

variable "private_subnet_cidr" {
  description = "CIDR block for private subnet"
}

variable "environment" {
  description = "Environment name"
}
