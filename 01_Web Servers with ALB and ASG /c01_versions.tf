terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.24.0"
    }
    random = {
      source = "hashicorp/random"
      version = "3.6.0"
    }
  }
}
provider "aws" {
  region = var.aws_region
  profile = "iamadmindev"
}

