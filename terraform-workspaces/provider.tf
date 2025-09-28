terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.8.0"
    }
  }
  backend "s3" {
    bucket         = "s3-terraform-dev"
    key            = "workspace"
    region         = "us-east-1"
    dynamodb_table = "dynamo-terraform-dev"
  }
}

provider "aws" {
  region = "us-east-1"
}
