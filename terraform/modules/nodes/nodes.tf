variable "cluster_name" {
  description = "Name of the EKS cluster this node group joins"
  type        = string
}

variable "cluster_version" {
  description = "Kubernetes version (kept for parity/future use, e.g. pinning AMI release)"
  type        = string
  default     = null
}

variable "private_subnet_ids" {
  description = "Private subnet IDs where worker nodes are launched"
  type        = list(string)
}

variable "cluster_certificate_authority" {
  description = "Cluster CA data (passed through in case bootstrap scripts need it)"
  type        = string
  default     = null
}

variable "cluster_endpoint" {
  description = "Cluster API endpoint (passed through in case bootstrap scripts need it)"
  type        = string
  default     = null
}

variable "node_role_arn" {
  description = "IAM role ARN for worker nodes (created in the eks-cluster module)"
  type        = string
}

variable "node_instance_types" {
  description = "EC2 instance types for worker nodes"
  type        = list(string)
  default     = ["t3.medium"]
}

variable "node_desired_size" {
  description = "Desired number of worker nodes"
  type        = number
  default     = 2
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

