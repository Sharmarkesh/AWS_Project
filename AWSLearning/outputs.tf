output "instance_id" {
  description = "The ID of the created EC2 instance"
  value       = module.ec2.instance_id
}

output "aws_region" {
  description = "The AWS region where resources are deployed"
  value       = module.ec2.aws_region
}

output "ami_id" {
  description = "The AMI ID used for the EC2 instance"
  value       = module.ec2.ami_id
}

output "instance_type" {
  description = "The type of the EC2 instance"
  value       = module.ec2.instance_type
}
