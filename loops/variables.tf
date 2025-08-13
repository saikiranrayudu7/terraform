variable "instance_names" {
    type = list
    default = ["MongoDB", "React"] 
}

variable "ami_id" {
  type    = string
  default = "ami-0b83c7f5e2823d1f4"
}
