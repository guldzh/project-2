#Change to your bucket name 
terraform {
  backend "s3" {
    bucket = "mytaskbucketdana"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
