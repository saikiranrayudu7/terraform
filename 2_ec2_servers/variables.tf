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
  default = "t2.micro"
}

variable "keyname" {
  type    = string
  default = "ansible"
}

variable "sg_type" {
  type    = list(string)
  default = ["sg-0c56a08ac6a78f8f2"]
}

variable "instances" {
  default = {
    "ansible" = "t2.micro"
    "mongodb" = "t2.micro"
  }
}
