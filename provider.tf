terraform {
  backend "s3" {
    bucket         = "anami-devops-tf-state"
    key            = "terraform-basics/terraform.tfstate"
    region         = "us-west-1"
    dynamodb_table = "terraform-state-locking"
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.26.0"
    }
  }
}

provider "aws" {
  region = "us-west-1"
}
