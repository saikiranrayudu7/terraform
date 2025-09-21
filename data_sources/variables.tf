variable "tag_name" {
  type    = string
  default = "web_terraform"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "key_name" {
  type    = string
  default = "ansible"
}
