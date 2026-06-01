resource "aws_instance" "devops_server" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "enterprise-devops-server"
    Environment = "dev"
  }
}
