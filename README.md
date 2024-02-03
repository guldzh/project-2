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
   - ECS Security Groups
     - Ingress and Egress rules configured for ECS requirements.
   - ALB Security Group
     - Ingress rules for ALB communication.

4. **IAM Role**
   - IAM Role with `actions = ["sts:AssumeRole"]`
   - Attached `service-role/AmazonECSTaskExecutionRolePolicy` for ECS execution.

5. **Application Load Balancer**
   - ALB with Listeners and Target Groups configured.

6. **ECS Cluster:**
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
   terraform plan
   terraform apply -auto-approve

7. Monitor the Terraform deployment process.
8. Access your NGINX application through the Application Load Balancer (ALB):
   Once the deployment is complete, the NGINX application will be accessible through the ALB.
   Obtain the ALB DNS name or IP address from the AWS Management Console.

   ```bash
   Example ALB URL: http://your-alb-dns-name-or-ip
