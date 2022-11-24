terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region                  = "us-east-2"
}
module "vpc" {
  source  = "spacelift.io/citagi63/vpc/default"
  version = "0.1.0"
}
