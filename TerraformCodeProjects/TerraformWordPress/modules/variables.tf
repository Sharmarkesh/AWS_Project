# Ec2 details
variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}


variable "ami_id" {
  description = "AMI ID to launch EC2 instances"
  type        = string
}

variable "key_name" {
  description = "Name of the existing EC2 key pair (created in the AWS Console)"
  type        = string
  default     = "wordpress_key"
}
# Security details
variable "ssh_port" {
  description = "Port for SSH access"
  type        = number
  default     = 22
}

variable "http_port" {
  description = "Port for HTTP access"
  type        = number
  default     = 80
}

variable "allowed_cidr" {
  description = "CIDR block allowed to reach the instance"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

#Database details
variable "db_name" {
  description = "WordPress database name"
  type        = string
  sensitive   = true
}

variable "db_user" {
  description = "WordPress database user"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "WordPress database password"
  type        = string
  sensitive   = true
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "availability_zone" {
  description = "AZ to place the public subnet in"
  type        = string
  default     = "eu-west-1a"
}
