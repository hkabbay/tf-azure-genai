# read secrets from keyvault
data "azurerm_key_vault_secret" "pg_server_administrator_login" {
  name         = var.pg_server_admin_login
  key_vault_id = var.key_vault_id
}

data "azurerm_key_vault_secret" "pg_server_administrator_login_password" {
  name         = var.pg_server_admin_password
  key_vault_id = var.key_vault_id
}

# create postgresql server
resource "azurerm_postgresql_server" "pg_server" {
  name                = var.postgresql_name
  location            = var.location
  resource_group_name = var.resource_group_name

  administrator_login          = data.azurerm_key_vault_secret.pg_server_administrator_login.value
  administrator_login_password = data.azurerm_key_vault_secret.pg_server_administrator_login_password.value

  sku_name   = var.postgresql_sku
  version    = var.postgresql_version
  storage_mb = var.storage_mb

  backup_retention_days        = 7
  geo_redundant_backup_enabled = true
  auto_grow_enabled            = true

  public_network_access_enabled    = false
  ssl_enforcement_enabled          = true
  ssl_minimal_tls_version_enforced = "TLS1_2"
}