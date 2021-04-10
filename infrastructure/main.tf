terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.35"
    }
  }
}

provider "aws" {
  profile = var.aws_profile
  region  = var.aws_region
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

/* Create S3 bucket */
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

/* Create RDS resource */
resource "aws_db_instance" "rds_postgres" {
  allocated_storage     = var.rds_allocated_storage
  max_allocated_storage = var.rds_max_allocated_storage
  engine                = var.rds_engine
  engine_version        = var.rds_engine_version
  instance_class        = var.rds_instance_class
  identifier            = var.rds_identifier
  name                  = data.aws_ssm_parameter.rds_db_name.value
  username              = data.aws_ssm_parameter.rds_username.value
  password              = data.aws_ssm_parameter.rds_password.value
  skip_final_snapshot   = true
}