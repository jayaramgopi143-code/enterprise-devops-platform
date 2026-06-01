module "vpc" {
  source = "../../modules/vpc"

  vpc_cidr            = var.vpc_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  environment         = var.environment
}

module "security_groups" {
  source = "../../modules/security-groups"

  vpc_id         = module.vpc.vpc_id
  environment    = var.environment
  ssh_allowed_ip = var.ssh_allowed_ip
}

module "iam" {
  source = "../../modules/iam"

  environment = var.environment
}

resource "aws_instance" "devops_server" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = module.vpc.public_subnet_id
  vpc_security_group_ids = [module.security_groups.security_group_id]
  key_name               = "enterprise-devops-key"
  user_data              = file("../../../scripts/install_docker.sh")
  iam_instance_profile   = module.iam.instance_profile_name

  tags = {
    Name        = "enterprise-devops-server"
    Environment = "dev"
  }
}
