output "ec2_instance_public_ip" {
  value = aws_instance.wordpress-instance.public_ip
}

output "ec2_endpoint" {
  value = aws_instance.wordpress-instance.public_dns
}

output "instance_id" {
  value = aws_instance.wordpress-instance.id
}

output "instance_type" {
  value = aws_instance.wordpress-instance.instance_type
}
