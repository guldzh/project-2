# ECS-with-Terraform

Tasks:

1. Pull NGNIX image from Docker Hub Registry, and create container using AWS ECS with Fargate Launch Type Using Terraform.
    1. The ECS Fargate can be deployed on Private/Public Subenet.
    2. Image should be read from Docker Hub Registry.

2. Create a GitHub workflow to run Terraform code

### List of created resources

1. VPC:
   1. Public Subnets
   2. Private Subnets
   3. Internet Gateway
   4. NAT Gateway
   5. Route Tables

2. Security Groups
3. IAM Role
4. Application Load Balancer
5. ECS Cluster
   1. ECS Service
   2. ECS tasks
