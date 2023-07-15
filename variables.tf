variable "name" {
  type        = string
  description = "The name to use when creating the database"
}

variable "dataset" {
  type        = string
  description = "The data set to use (currently the only option is employees)"
  default     = "employees"
}

variable "username" {
  type        = string
  description = "Username to use when creating the database"
  default     = "dbuser"
}

variable "password" {
  type        = string
  description = "Password to use when creating the database (If not specified a random string will be used)"
  sensitive   = true
}
