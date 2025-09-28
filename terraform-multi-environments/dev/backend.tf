# terraform {
#   backend "s3" {
#     bucket         = "s3-terraform-dev"
#     key            = "sg.tfstate"
#     region         = "us-east-1"
#     dynamodb_table = "dynamo-terraform-dev"
#   }
# }

bucket         = "s3-terraform-dev"
key            = "sg.tfstate"
region         = "us-east-1"
dynamodb_table = "dynamo-terraform-dev"