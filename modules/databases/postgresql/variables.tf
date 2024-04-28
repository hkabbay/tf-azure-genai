# add variables for key vault
variable "key_vault_id" {
  type = string
}

variable "pg_server_admin_login" {
  type = string
}

variable "pg_server_admin_password" {
  type = string
}

# add variables for postgresql
variable "postgresql_name" {
  type = string
}

variable "postgresql_sku" {
  type = string
}

variable "postgresql_version" {
  type = string
}

variable "storage_mb" {
  type = number
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}