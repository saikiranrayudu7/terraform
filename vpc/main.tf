resource "aws_vpc" "main" {
  cidr_block           = var.cidr_block
  enable_dns_hostnames = var.enable_dns_hostnames
  tags = merge(var.common_tags, var.vpc_tags,
    {
      Name = local.tagName
    }
  )
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = merge(var.common_tags, var.igw_tags,
    {
      Name = local.tagName
    }
  )
}

resource "aws_subnet" "public" {
    count = length(var.public_subnets_cidr)
    vpc_id = aws_vpc.main.id
    cidr_block = var.public_subnets_cidr[count.index]
    availability_zone = local.az_names[count.index]

    tags = merge(
        var.common_tags,
        var.public_subnets_tags,
        {
            Name = "${local.tagName}-${local.az_names[count.index]}"
        }
    )
}