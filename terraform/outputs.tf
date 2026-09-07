output "vpc_id" {
  value = module.vpc.vpc_id

}

output "public_subnet_ids" {
  value = module.vpc.public_subnets

}

output "private_subnet_ids" {
  value = module.vpc.private_subnets

}

output "database_subnet_ids" {
  value = module.vpc.database_subnets

}

output "alb_controller_role_arn" {
  value = module.alb_controller_irsa.iam_role_arn
}

output "cluster_autoscaler_role_arn" {
  value = module.cluster_autoscaler_irsa.iam_role_arn
}