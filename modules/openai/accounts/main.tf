# create azure openai account
resource "azurerm_cognitive_account" "openai" {
  name                = var.openai_account_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name            = var.openai_sku
  kind                = var.openai_kind
  tags                = var.tags
  custom_subdomain_name = var.openai_account_name
  network_acls {
    default_action = "Deny"
    ip_rules       = var.allowed_ip_addresses
  }
}