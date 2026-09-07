module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version

  cluster_endpoint_public_access       = true
  cluster_endpoint_private_access      = true
  cluster_endpoint_public_access_cidrs = ["202.168.87.227/32"]

  vpc_id                                   = module.vpc.vpc_id
  subnet_ids                               = module.vpc.private_subnets
  enable_irsa                              = true
  enable_cluster_creator_admin_permissions = false

  tags = {
    cluster = "project"
  }

  access_entries = {
    terraform_user = {
      principal_arn = "arn:aws:iam::277328279179:user/terraform-user"

      policy_associations = {
        admin = {
          policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"

          access_scope = {
            type = "cluster"
          }
        }
      }
    }

    github_actions_runner = {
      principal_arn = "arn:aws:iam::277328279179:role/shopverse-deploy"

      policy_associations = {
        admin = {
          policy_arn   = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
          access_scope = { type = "cluster" }
        }
      }
    }
  }

  eks_managed_node_group_defaults = {
    ami_type               = "AL2023_x86_64_STANDARD"
    instance_types         = ["c7i-flex.large"]
    vpc_security_group_ids = [aws_security_group.eks_node_sg.id]
  }

  eks_managed_node_groups = {
    workers = {
      min_size     = 2
      max_size     = 6
      desired_size = 2
    }
  }
}