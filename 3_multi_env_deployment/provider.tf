terraform {
  required_version = "~> 1.7"

  backend "s3" {
    bucket = "luna-multi-env-deployment"
    key    = "multi-env-tf-state/state.tfstate"
    region = "us-east-1"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}
