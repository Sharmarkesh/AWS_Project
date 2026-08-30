module "ec2" {
  source = "./modules/ec2"

  aws_region    = var.aws_region
  ami_id        = var.ami_id
  instance_type = var.instance_type
}

moved {
  from = aws_instance.EC2
  to   = module.ec2.aws_instance.EC2
}

moved {
  from = aws_instance.import
  to   = module.ec2.aws_instance.import
}
