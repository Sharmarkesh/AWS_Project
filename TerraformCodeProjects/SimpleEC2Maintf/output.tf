output "instance_id" {
  description = "The ID of the created EC2 instance"
  value       = aws_instance.FirstEC2.id
}

output "aws_region" {
  description = "The AWS region where resources are deployed"
  value       = var.aws_region
}

output "ami_id" {
  description = "The AMI ID used for the EC2 instance"
  value       = var.ami_id
}

output "instance_type" {
  description = "The type of the EC2 instance"
  value       = aws_instance.FirstEC2.instance_type
}