variable "ami_id" {
  type    = string
  default = "ami-08982f1c5bf93d976"
}

variable "instance_name" {
  type    = string
  default = "web-server"
}

variable "instance_type" {
  type    = string
  default = "t2.large"
}

variable "keyname" {
  type    = string
  default = "ansible"
}

variable "sg_type" {
  type    = list(string)
  default = ["sg-0a7c2b5877b68a711"]
}

variable "instances" {
  default = {
    "dev"  = "t2.micro"
    "prod" = "t2.micro"
  }
}
