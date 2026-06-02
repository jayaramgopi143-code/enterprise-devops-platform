terraform {
  backend "s3" {
    bucket       = "jayaram-enterprise-devops-tfstate"
    key          = "env/terraform.tfstate"
    region       = "ap-south-1"
    use_lockfile = true
  }
}
