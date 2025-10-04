variable "cidr_block" {
  default = "10.0.0.0/16"
  type    = string
}

variable "enable_dns_hostnames" {
  default = true
  type    = bool
}

variable "common_tags" {
  default = {
    Project     = "roboshop"
    Environment = "dev"
    Terraform   = "true"
  }
  type = map(string)
}

variable "vpc_tags" {
  default = {}
  type    = map(string)
}

variable "project_name" {
  default = "roboshop"
  type    = string
}

variable "environment" {
  default = "dev"
  type    = string
}

variable "public_subnets_cidr" {
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}