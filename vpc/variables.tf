variable "cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}

variable "enable_dns_hostnames" {
  type    = bool
  default = true
}

variable "common_tags" {
  type    = map(string)
  default = {}
}

variable "vpc_tags" {
  type    = map(string)
  default = {}
}

variable "project_name" {
  default = ""
  type    = string
}

variable "environment" {
  default = ""
  type = string
}

variable "igw_tags" {
  type    = map(string)
  default = {}
}