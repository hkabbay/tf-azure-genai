# get cognitive account id
data "azurerm_cognitive_account" "example" {
  name                = var.openai_account_name
  resource_group_name = var.resource_group_name
}


resource "azurerm_cognitive_deployment" "example" {
  name                 = var.openai_deployment_name
  cognitive_account_id = data.azurerm_cognitive_account.example.id
  model {
    format  = "OpenAI"
    name    = var.openai_model_name
    version = "1"
  }
  scale {
    type = "Standard"
    capacity = var.capacity
  }
}