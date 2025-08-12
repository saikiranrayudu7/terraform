variable "ami_id" {
  type    = string
  default = "ami-0b83c7f5e2823d1f4"
}

variable "ec2-Name" {
  type    = string
  default = "HelloTerraform"
}

variable "sg-name" {
  type    = string
  default = "terraform-sg-demo"
}

variable "sg-description" {
  type = string
  default = "security group inbound rules"
}

variable "ingress-description" {
  type = string
  default = "Inbound rules"
}

variable "egress-description" {
  type = string
  default = "Outbound rules"
}

variable "tags" {
  type = map
  default = {
    Name = "Hello Terraform"
    Project = "Roboshop"
    Environment = "DEV"
    Component = "Web"
    Terraform = "true"
  }
}