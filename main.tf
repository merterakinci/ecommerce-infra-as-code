terraform {
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

resource "aws_s3_bucket" "first_bucket" {
  bucket = var.bucket_name

  tags = {
    Environment = var.environment
    Project     = "terraform-first-steps"
    ManagedBy   = "terraform"
  }
}
