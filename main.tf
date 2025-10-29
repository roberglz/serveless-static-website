terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
  backend "s3" {
    bucket = "terraform-bucket-291025"
    key    = "serveless-static-website/terraform.tfstate"
    region = "eu-west-1"
  }

}

# Configure the AWS Provider
provider "aws" {
  region = "eu-west-1"
}

resource "random_id" "bucket_suffix" {
  byte_length = 4
}
# Create a S3 Bucket
resource "aws_s3_bucket" "bucket" {
  bucket = "bucket-${random_id.bucket_suffix.hex}"
}
