variable "ami_id" {
  type    = string
  default = "ami-00ca32bbc84273381"
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

variable "instance_names" {
  type        = map(string)
  description = "Map of instance name => instance_type (set per-environment in tfvars)"
  default     = {}
}
