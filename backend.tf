#Change to your bucket name 
terraform {
  backend "s3" {
    bucket = "mytaskbucketdana1"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
