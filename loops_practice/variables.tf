variable "ami_id" {
  type = string
  default = "ami-08982f1c5bf93d976"
}

variable "instance_type" {
  type = string
  default = "t2.small"
}

variable "instance_name" {
  type = list(string)
  default = ["web-server","app-server","db-server"]
}

variable "key_name" {
    type = string
    default = "ansible"
}