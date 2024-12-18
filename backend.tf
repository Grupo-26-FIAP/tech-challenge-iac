terraform {
  backend "s3" {
    bucket = "eks-tech-challenge-backend-tf"
    key = "tech-challenge/terraform.tfstate"
    region = "us-east-1"
  }
}