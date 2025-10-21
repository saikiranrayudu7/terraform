variable "ami_id" {
  type = string
  default = "ami-0341d95f75f311023"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "key_name" {
    type = string
    default = "ansible"
}

variable "sg_type" {
  type    = list(string)
  default = ["sg-0828ef0b5b9ebc12b"]
}