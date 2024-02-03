# Docker-ECS-Terraform

This project demonstrates the deployment of NGINX on AWS ECS with Fargate Launch Type using Terraform.

## Tasks

### 1. Deploy NGINX on AWS ECS

#### 1.1 Fargate Deployment

Pull NGINX image from Docker Hub Registry and create a container using AWS ECS with Fargate Launch Type. Choose between deployment on Private or Public Subnets.

**Note:** Ensure that the NGINX image is read from the Docker Hub Registry.

### 2. GitHub Workflow for Terraform

A GitHub workflow has been set up to run Terraform code, automating the infrastructure deployment process.

## List of Created Resources

1. **VPC:**
   - Public Subnets
   - Private Subnets
   - Internet Gateway
   - NAT Gateway
   - Route Tables

2. **Security Groups**

3. **IAM Role**

4. **Application Load Balancer**

5. **ECS Cluster:**
   - ECS Service
   - ECS Tasks

## Getting Started

To deploy NGINX on AWS ECS and set up the infrastructure, follow the steps below:

1. Clone this repository:

   ```bash
   git clone https://github.com/guldzh/project-2.git
2. Navigate to the project directory:
   
   ```bash
   cd Docker-ECS-Terraform
4. Customize the Terraform variables in variables.tf to match your requirements.

5. Run the Terraform commands:

   ```bash
   terraform init
   terraform apply -auto-approve
   Note: Provide any required variables during the terraform apply command.

7. Monitor the Terraform deployment process.
8. Access your NGINX application on AWS ECS.
