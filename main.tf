terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.35"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "eu-west-3"
}

/* Create AWS EC2 instance */
resource "aws_instance" "ec2_instance" {
  ami           = var.image_id
  instance_type = var.ec2_instance_type
  key_name      = var.ec2_key_pair
  tags = {
    Name = var.ec2_instance_name
  }
}

/* Create AWS Elastic Container Registry  */
resource "aws_ecr_repository" "ecr" {
  name = var.ecr_repository_name
}

/* Create S3 bucket to store an html file */
resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.s3_bucket_name
  acl    = var.s3_bucket_acl

  tags = {
    Name = var.s3_bucket_name
  }

  versioning {
    enabled = true
  }
}