terraform {
  required_version = ">= 1.7"
  backend "s3" {
    bucket         = "shopverse-state-backend"
    key            = "shopverse/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "shopverse-state-lock"
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.95"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.36"
    }

    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.17"
    }
  }
}
