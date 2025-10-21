terraform {
  backend "s3" {
    bucket         = "state-terraform-bucket-demo"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock-table"
    encrypt        = true
  }
}
