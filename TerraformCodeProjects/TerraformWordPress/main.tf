module "this"{
source = "./modules"

# Required — no default in the module, must be supplied
  aws_region    = var.aws_region
  instance_type = var.instance_type
  ami_id        = var.ami_id
  db_name       = var.db_name
  db_user       = var.db_user
  db_password   = var.db_password

  # Optional — module already has sensible defaults;
  # only override if this environment needs something different
  key_name            = var.key_name
  allowed_cidr         = var.allowed_cidr
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidr   = var.public_subnet_cidr
  availability_zone    = var.availability_zone
}
