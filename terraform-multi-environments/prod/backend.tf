# terraform {
#   backend "s3" {
#     bucket         = "s3-terraform-prod1"
#     key            = "sg.tfstate"
#     region         = "us-east-1"
#     dynamodb_table = "dynamo-terraform-prod1"
#   }
# }

bucket         = "s3-terraform-prod1"
key            = "sg.tfstate"
region         = "us-east-1"
dynamodb_table = "dynamo-terraform-prod1"