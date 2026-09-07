variable "aws_region" {
  default = "us-east-1"
}

variable "cluster_name" {
  default = "project3-cluster"
}

variable "cluster_version" {
  default = "1.30"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  default     = ["10.0.101.0/24", "10.0.102.0/24"]
}

variable "node_instance_types" {
  type = list(string)
  default = ["t3.medium"]

}

variable "node_desired_size" {
  type = number
  default = 2
}

variable "node_min_size" {
  description = "Minimum number of worker nodes"
  type        = number
  default     = 2
}

variable "node_max_size" {
  description = "Maximum number of worker nodes"
  type        = number
  default     = 3
}










