data "aws_availability_zones" "available" {}

module "vpc" {

  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.7"

  name                         = "${var.cluster_name}-vpc"
  cidr                         = var.vpc_cidr
  azs                          = slice(data.aws_availability_zones.available.names, 0, 2)
  private_subnets              = var.private_subnets
  public_subnets               = var.public_subnets
  database_subnets             = var.database_subnets
  create_database_subnet_group = true
  enable_nat_gateway           = true
  single_nat_gateway           = false
  one_nat_gateway_per_az       = true
  enable_dns_hostnames         = true
  enable_dns_support           = true

  public_subnet_tags = {
    "kubernetes.io/role/elb"                    = 1
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
  }

  private_subnet_tags = {
    "kubernetes.io/role/internal-elb"           = 1
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
  }



}


