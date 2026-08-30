terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
}

resource "aws_s3_bucket" "first_bucket" {
  bucket = "merter-first-terraform-bucket-2026"

  tags = {
    Environment = "Learning"
    Project     = "terraform-first-steps"
  }
}
