# create azure search service with api keys and network rules
resource "azurerm_search_service" "aisearch" {
  name                = var.aisearch_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.aisearch_sku

  local_authentication_enabled = true
  authentication_failure_mode  = "http403"
  public_network_access_enabled = true
  allowed_ips = var.allowed_ip_addresses
  tags = var.tags
}