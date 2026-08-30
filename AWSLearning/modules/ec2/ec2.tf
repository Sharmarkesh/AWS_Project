resource "aws_instance" "EC2" {
  ami           = var.ami_id
  instance_type = var.instance_type
}

resource "aws_instance" "import" {
  ami           = var.ami_id
  instance_type = var.instance_type

  user_data_replace_on_change = false

  tags = {
    Name = "importtest"
  }
}
