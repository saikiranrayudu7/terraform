module "minikube" {
  source = "github.com/scholzj/terraform-aws-minikube"

  aws_region    = "us-east-1"
  cluster_name  = "roboshop"
  aws_instance_type = "t3.medium"
  ssh_public_key = "~/Downloads/ansible.pub"
  aws_subnet_id = "subnet-09c33c0435c248f1d"
  #ami_image_id = "ami-b81dbfc5"
  hosted_zone = "example.local"
  hosted_zone_private = true


  tags = {
    Application = "Minikube"
  }

  addons = [
      "https://raw.githubusercontent.com/scholzj/terraform-aws-minikube/master/addons/kubernetes-dashabord/init.sh",
      "https://raw.githubusercontent.com/scholzj/terraform-aws-minikube/master/addons/kubernetes-metrics-server/init.sh",
      "https://raw.githubusercontent.com/scholzj/terraform-aws-minikube/master/addons/external-dns/init.sh",
      "https://raw.githubusercontent.com/scholzj/terraform-aws-minikube/master/addons/kubernetes-nginx-ingress/init.sh"
  ]
}