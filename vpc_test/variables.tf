variable "common_tags" {
  type = map(string)
  default = {
    Project     = "Roboshop"
    Environment = "Dev"
    Terraform   = "true"
  }
}

variable "vpc_tags" {
  type    = map(string)
  default = {}
}

variable "project_name" {
  default = "devops"
  type    = string
}

variable "environment" {
    default = "dev"
  type    = string
}