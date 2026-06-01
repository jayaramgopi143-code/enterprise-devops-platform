variable "aws_region" {
  default = "ap-south-1"
}

variable "ami_id" {
  description = "Ubuntu AMI ID"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t3.micro"
}
