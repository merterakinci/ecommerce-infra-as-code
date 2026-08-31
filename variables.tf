variable "aws_region" {
  description = "AWS region where resources will be created"
  type        = string
  default     = "eu-central-1"
}

variable "environment" {
  description = "Deployment environment (e.g. learning, dev, staging, prod)"
  type        = string
  default     = "learning"
}

variable "bucket_name" {
  description = "Globally unique name for the S3 bucket"
  type        = string
  default     = "merter-first-terraform-bucket-2026"
}

variable "db_username" {
  description = "Master username for the RDS database"
  type        = string
  default     = "ecommerce_admin"
}

variable "db_password" {
  description = "Master password for the RDS database"
  type        = string
  sensitive   = true
}
