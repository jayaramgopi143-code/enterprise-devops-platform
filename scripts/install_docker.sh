#!/bin/bash

# Update packages
apt-get update -y

# Install Docker
apt-get install docker.io -y

# Start Docker
systemctl start docker
systemctl enable docker

# Install AWS CLI
apt-get install awscli -y

# Add ubuntu user to docker group
usermod -aG docker ubuntu

# Login to Amazon ECR
aws ecr get-login-password --region ap-south-1 | docker login \
--username AWS \
--password-stdin 433939225422.dkr.ecr.ap-south-1.amazonaws.com

# Pull latest Docker image
docker pull 433939225422.dkr.ecr.ap-south-1.amazonaws.com/enterprise-devops-app:latest

# Run Docker container
docker run -d \
--restart unless-stopped \
-p 80:80 \
--name enterprise-devops-app \
433939225422.dkr.ecr.ap-south-1.amazonaws.com/enterprise-devops-app:latest

# Create bootstrap log
echo "Bootstrap completed" > /home/ubuntu/bootstrap.log
