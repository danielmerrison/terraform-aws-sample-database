output "address" {
  value = aws_db_instance.this.address
}

output "username" {
  value = aws_db_instance.this.username
}

output "password" {
  value     = aws_db_instance.this.password
  sensitive = true
}
