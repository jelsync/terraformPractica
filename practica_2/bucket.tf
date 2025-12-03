terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region  = "us-east-2"      # ajustar según donde quieras crear recursos
  profile = "personal"
}

resource "aws_s3_bucket" "proveedores" {
  bucket = "proveedores-jelsyn-test-bucket"
}