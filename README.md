# DevOps Sandbox

This repository contains resources for setting up a DevOps Sandbox on AWS EC2 (Amazon Linux 2) with Docker, Jenkins, Helm, and Minikube. The sandbox is designed to help you quickly start a development environment for learning and experimenting with various DevOps tools and practices.

## Prerequisites

1. An AWS account with appropriate permissions to create and manage EC2 instances, VPCs, and other necessary resources.
2. The [AWS CLI](https://aws.amazon.com/cli/) installed and configured on your local machine.

## Features

- Amazon Linux 2 EC2 instance
- Docker for containerization
- Jenkins for continuous integration and delivery
- Helm for Kubernetes package management
- Minikube for running Kubernetes locally

## Setup

1. Clone this repository:

```bash
git clone https://github.com/EJT93/DevOps_Sandbox.git
cd DevOps_Sandbox

2. Update the Sandbox.yaml CloudFormation template with the required parameters, such as the EC2 Key Pair name, VPC ID, and Subnet ID.

3. Update the commands.sh or commandsContainerizedJenkins.sh script as needed to customize the installation and configuration of the tools.

4. Create an S3 bucket to store your CloudFormation templates and scripts. Upload the Sandbox.yaml and the desired commands.sh or commandsContainerizedJenkins.sh script to the bucket. Update the UserData section in the Sandbox.yaml template to reference the correct script file.

5. Deploy the CloudFormation stack using the AWS CLI:
aws cloudformation create-stack --stack-name DevOpsSandbox --template-body file://Sandbox.yaml --capabilities CAPABILITY_NAMED_IAM --parameters ParameterKey=KeyName,ParameterValue=<YOUR_KEY_NAME> ParameterKey=VPCId,ParameterValue=<YOUR_VPC_ID> ParameterKey=SubnetId,ParameterValue=<YOUR_SUBNET_ID>
- Replace <YOUR_KEY_NAME>, <YOUR_VPC_ID>, and <YOUR_SUBNET_ID> with the appropriate values for your AWS environment.

6. Once the stack creation is complete, you can access the Jenkins web interface by navigating to the instance's public IP address followed by the port number 8080 (e.g., http://<INSTANCE_PUBLIC_IP>:8080). Retrieve the initial admin password from the Jenkins instance:
sudo cat /var/lib/jenkins/secrets/initialAdminPassword

7. Complete the Jenkins setup by following the prompts and installing the desired plugins.

Contributing
If you have any suggestions or improvements for this project, feel free to create a pull request or open an issue. Your contributions are welcome!
