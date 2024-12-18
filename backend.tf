terraform {
  backend "s3" {
    bucket = "tech-challenge-backend-tf"
    key = "tech-challenge/terraform.tfstate"
    region = "us-east-1"
  }
}