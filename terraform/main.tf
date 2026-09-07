terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

}

provider "aws" {
  region = var.aws_region
}

data "aws_availability_zones" "available" {
  state = "available"
}

module "vpc" {
  source = "./modules/vpc"

  cluster_name = var.cluster_name
  vpc_cidr = var.vpc_cidr
  azs = slice(data.aws_availability_zones.available.names, 0, 2)
  public_subnet_cidrs = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
}

module "eks_cluster" {
  source = "./modules/eks-cluster"

  cluster_name = var.cluster_name
  cluster_version = var.cluster_version
  vpc_id = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
  private_subnet_ids = module.vpc.private_subnet_ids  

}

module "nodes" {
  source = "./modules/nodes"

  cluster_name = var.cluster_name
  cluster_version = var.cluster_version
  private_subnet_ids = module.vpc.private_subnet_ids

  cluster_certificate_authority = module.eks_cluster.cluster_certificate_authority_data
  cluster_endpoint               = module.eks_cluster.cluster_endpoint
  node_role_arn                  = module.eks_cluster.node_role_arn

  node_instance_types = var.node_instance_types
  node_desired_size   = var.node_desired_size
  node_min_size       = var.node_min_size
  node_max_size       = var.node_max_size

  depends_on = [module.eks_cluster]
   
}




