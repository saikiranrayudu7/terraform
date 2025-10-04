module "vpc_module" {
    source = "../vpc"
    project_name = var.project_name
    environment = var.environment
    common_tags = var.common_tags
    vpc_tags = var.vpc_tags

    public_subnets_cidr = var.public_subnets_cidr
}