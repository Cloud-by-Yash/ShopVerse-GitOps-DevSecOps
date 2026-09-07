variable "aws_region" {
  type = string

}

variable "cluster_name" {
  type = string

}

variable "vpc_cidr" {
  type = string

}

variable "private_subnets" {
  type = list(string)

}
variable "public_subnets" {
  type = list(string)

}
variable "database_subnets" {
  type = list(string)

}

variable "cluster_version" {
  type = string

}

variable "db_name" {
  type = string
}

variable "db_username" {
  type = string
}

variable "db_password" {
  type      = string
  sensitive = true
}

variable "db_instance_class" {
  type = string
}