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
  ami           = "ami-0d6aecf0f0425f42a"   // ubuntu ami id
  instance_type = "t2.micro"
  key_name = "infinite-key"
  tags = {
    Name = "jenkins_host"
  }
}
