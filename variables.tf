variable "ec2_instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "jenkins-host"
}

variable "image_id" {
  description = "ID of the ami for the EC2 instance (region specific)"
  type        = string
  default     = "ami-0d6aecf0f0425f42a" //  Ubuntu Server 20.04 LTS (HVM), SSD Volume Type
}

variable "ec2_instance_type" {
  description = "Type of the EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "ec2_key_pair" {
  description = "Key pair to the EC2 instance"
  type        = string
  default     = "infinite-key"
}

variable "ecr_repository_name" {
  description = "Name of the Amazon ECR repository"
  type        = string
  default     = "infinite"
}

variable "s3_bucket_name" {
  description = "Value of the Name tag for the S3 bucket"
  type        = string
  default     = "web-host-bucket"
}

variable "s3_bucket_acl" {
  description = "The canned Amazon S3 access control list (ACL) to apply"
  type        = string
  default     = "public-read"
}