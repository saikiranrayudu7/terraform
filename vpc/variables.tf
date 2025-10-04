variable "cidr_block" {
  default = "10.0.0.0/16"
  type = string
}

variable "public_subnets_cidr" {
  type = list
  validation {
    condition = length(var.public_subnets_cidr) == 2
    error_message = "Please give 2 public subnet CIDR"
  }
}

variable "enable_dns_hostnames" {
  default = true
  type = bool
}

variable "common_tags" {
  default = {}
  type = map(string)
}

variable "vpc_tags" {
    default = {}
    type = map(string)
}

variable "igw_tags" {
    default = {}
    type = map(string)
}

variable "public_subnets_tags" {
  default = {}
  type = map(string)
}

variable "project_name" {
    default = ""
    type = string
}

variable "environment" {
    default = ""
    type = string
}