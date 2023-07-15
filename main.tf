resource "random_password" "this" {
  length           = 16
  special          = true
  override_special = "_%@"
}

resource "aws_db_instance" "this" {
  name                 = var.name
  allocated_storage    = 10
  engine               = "mariadb"
  engine_version       = "10.5"
  instance_class       = "db.t3.micro"
  username             = var.username
  password             = var.password ? var.password : random_password.password
  parameter_group_name = "default.mariadb10.5"
  skip_final_snapshot  = true
  publicly_accessible  = true

  provisioner "local-exec" {
    command = "mysql --user=${self.username} --password=${self.password} --host=${self.address} < ${path.module}/datasets/${var.dataset}.sql"
  }
}

