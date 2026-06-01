resource "aws_instance" "devops_server" {
  ami           = "ami-07a00cf47dbbc844c"
  instance_type = "t3.micro"

  tags = {
    Name = "enterprise-devops-server"
    Environment = "dev"
  }
}
