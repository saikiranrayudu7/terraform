variable "instance_type" {
    type = map
    default = {
        "web" = "t2.micro"
        "db"  = "t2.micro"
        "cache" = "t2.micro"
    }
  
}