variable "instance_type" {
  type = map(string)
  default = {
    dev  = "t2.micro"
    prod = "t2.micro"
  }
}

variable "ami_id" {
  default = "ami-0c55b159cbfafe1f0"
  type    = string
}
