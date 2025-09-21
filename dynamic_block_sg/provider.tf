terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.8.0"
    }
  }

  backend "s3" {
    bucket         = "s3-terraform-devops-demo"
    key            = "sg.tfstate"
    region         = "us-east-1"
    dynamodb_table = "dynamodb-terraform-demo1"
  }

}

provider "aws" {
  region = "us-east-1"
}
