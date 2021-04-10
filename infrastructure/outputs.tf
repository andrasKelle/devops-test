output "ec2_instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.ec2_instance.id
}

output "ec2_instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.ec2_instance.public_ip
}

output "ecr_repository_url" {
  description = "URL of the AWS ECR repository"
  value = aws_ecr_repository.ecr.repository_url
}

output "s3_bucket_id" {
  description = "The name of the S3 bucket"
  value = aws_s3_bucket.s3_bucket.id
}

output "s3_bucket_domain_name" {
  description = "Bucket domain name"
  value = aws_s3_bucket.s3_bucket.bucket_domain_name
}

output "rds_id" {
  description = "The ID of the RDS instance"
  value = aws_db_instance.rds_postgres.id
}

output "rds_hostname" {
  description = "The address of the RDS instance"
  value = aws_db_instance.rds_postgres.address
}