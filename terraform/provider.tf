#----------------------------------------
# Terraform and provider configuration
#----------------------------------------
terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = var.aws_region

  # Applied to every resource so they're easy to find and clean up
  default_tags {
    tags = {
      Project   = "techpathway-tc2"
      ManagedBy = "terraform"
    }
  }
}