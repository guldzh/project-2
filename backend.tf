#Change to your bucket name 
terraform {
  backend "s3" {
    bucket = "guliya-ecs-bucket"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
