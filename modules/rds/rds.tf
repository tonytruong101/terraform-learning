module "rds" {
  source = "./module/rds"

  engine                 = var.engine
  instance_class         = var.instance_class
  allocated_storage      = var.allocated_storage
  name                   = var.name
  username               = var.username
  password               = var.password
  vpc_security_group_ids = var.vpc_security_group_ids
  subnet_ids             = var.subnet_ids
  publicly_accessible    = var.publicly_accessible
}

