module "database" {
  source = "./modules/rds"

  project_name       = "luna-rds-db"
  security_group_ids = [aws_security_group.compliant.id]
  subnet_ids = [
    aws_subnet.private1.id,
    aws_subnet.private2.id
  ]
  credentials = {
    username = "dbadmin"
    password = "Test_Pass-123?"
  }
  
  # Automated backups
  backup_retention_period = 3 # number of days
  backup_window           = "08:05-08:50"
  maintenance_window      = "Sun:05:00-Sun:06:00"
}
