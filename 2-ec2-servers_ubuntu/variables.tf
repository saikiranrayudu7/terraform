variable "ami_id" {
  type    = string
  default = "ami-0360c520857e3138f"
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
  default = ["sg-0828ef0b5b9ebc12b"]
}

variable "instances" {
  default = {
    "ansible" = "t2.micro"
    "node1" = "t2.medium"
  }
}
