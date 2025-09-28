variable "instance_type" {
  type = map(string)
  default = {
    dev  = "t2.micro"
    prod = "t2.micro"
  }
}

variable "ami_id" {
  type    = string
  default = "ami-00ca32bbc84273381"
}
