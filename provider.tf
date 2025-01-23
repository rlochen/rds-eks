# AWS Provider Configuration
provider "aws" {
  region     = "ap-southeast-2"
}

# Terraform Backend (Optional, if using remote backend like S3)
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "dev-m-tf-state"
    key            = "project/rds-project/terraform.tfstate"
    region         = "ap-southeast-2"
    encrypt        = true
    dynamodb_table = "terraform-lock-table"
  }
}
