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
  bucket = "merter-ilk-terraform-bucket-2026"  # global olarak benzersiz olmalı, kendi isminizi ekleyin

  tags = {
    Environment = "Learning"
    Project     = "Terraform-First-Steps"
  }
}
