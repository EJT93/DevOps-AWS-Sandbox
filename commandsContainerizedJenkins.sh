#!/bin/bash

# Update the system
sudo yum update -y

# Install Docker
sudo yum install docker -y
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -a -G docker ec2-user

# Enable Amazon Linux Extras and JDK
sudo bash -c 'echo -e "[amzn2extra]\nname=Amazon Linux 2 Extras Repository\nbaseurl=https://amazonlinux2-repositories.s3.amazonaws.com/amazon-linux-extras\ngpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-amzn2\ngpgcheck=1\nenabled=1" > /etc/yum.repos.d/amzn2-extras.repoTEST'
sudo yum update -y
sudo amazon-linux-extras enable corretto-11
sudo yum install -y fontconfig java-11-amazon-corretto

# Pull and run Jenkins as a Docker container
sudo docker pull jenkins/jenkins:lts
sudo docker run -d -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home --name jenkins --restart always jenkins/jenkins:lts

# Install Helm
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

# Install Minikube
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
chmod +x minikube
sudo mkdir -p /usr/local/bin/
sudo install minikube /usr/local/bin/
