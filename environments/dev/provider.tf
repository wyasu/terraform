terraform {
  required_version = ">= 1.3.8, < 2.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.54.0"
    }
  }
}

provider "aws" {
  region = "ap-northeast-1"
}

