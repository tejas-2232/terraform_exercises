# configure microsoft azure provider

provider "azurerm" {
  features {}
  #  subscription_id = "xxxxxxxxxxxxxxxxxxxxxx"
  #  client_id = "xxxxxxxxxxxxxxxxxxxxxx"
  #  client_secret = "xxxxxxxxxxxxxxxxxxxxxx"
  #  tenant_id = "xxxxxxxxxxxxxxxxxxxxxx"
}

# create resource group
resource "azurerm_resource_group" "expample_rg_red" {
  name     = "example-resource-RG"
  location = "eastus"

  tags = {
    "owner"   = "tejas b"
    "project" = "Automation"
  }
}
