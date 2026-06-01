#!/bin/bash

# Update packages
apt-get update -y

# Install Docker
apt-get install docker.io -y

# Start Docker
systemctl start docker
systemctl enable docker

# Install Git
apt-get install git -y

# Install curl
apt-get install curl -y

# Add ubuntu user to docker group
usermod -aG docker ubuntu

# Create log file
echo "Bootstrap completed" > /home/ubuntu/bootstrap.log
