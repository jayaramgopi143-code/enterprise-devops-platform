aws_region = "ap-south-1"
ami_id     = "ami-07a00cf47dbbc844c"
vpc_cidr   = "10.0.0.0/16"

public_subnet_cidr = "10.0.1.0/24"

private_subnet_cidr = "10.0.2.0/24"

# Strict Firewall Whitelisting - Allows only your home network to SSH
ssh_allowed_ip = "49.204.239.52/32"
