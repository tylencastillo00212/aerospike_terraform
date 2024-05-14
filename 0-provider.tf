# Configure the AWS Provider
provider "aws" {
  region = "us-west-2"
}

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}