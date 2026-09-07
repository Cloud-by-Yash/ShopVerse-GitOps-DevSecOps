aws_region = "us-east-1"

cluster_name = "shopverse-prod"

vpc_cidr = "10.0.0.0/16"

cluster_version = "1.34"

private_subnets = [
  "10.0.1.0/24",
  "10.0.2.0/24"
]

public_subnets = [
  "10.0.4.0/24",
  "10.0.5.0/24"
]

database_subnets = [
  "10.0.10.0/24",
  "10.0.11.0/24"
]



db_name           = "value"
db_username       = "value"
db_password       = "value"
db_instance_class = "value"