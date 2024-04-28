# define output variables
output "openai_account_name" {
  value = azurerm_cognitive_account.openai.name
}

output "openai_location" {
  value = azurerm_cognitive_account.openai.location
}

