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

# Enable versioning on the S3 bucket to protect against accidental deletion or overwrite
resource "aws_s3_bucket_versioning" "first_bucket_versioning" {
  bucket = aws_s3_bucket.first_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

# Lifecycle policy: keep only 1 old (noncurrent) version, delete anything older automatically
resource "aws_s3_bucket_lifecycle_configuration" "first_bucket_lifecycle" {
  bucket = aws_s3_bucket.first_bucket.id

  rule {
    id     = "limit-noncurrent-versions"
    status = "Enabled"

    filter {}

    noncurrent_version_expiration {
      noncurrent_days           = 1
      newer_noncurrent_versions = 1
    }
  }

  depends_on = [aws_s3_bucket_versioning.first_bucket_versioning]
}
