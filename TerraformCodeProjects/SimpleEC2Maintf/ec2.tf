resource "aws_instance" "FirstEC2" {
  ami           = var.ami_id
  instance_type = var.instance_type
  tags = {
    Name = "SimpleEC2"
  }
}

