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
    name = "example-resource-RG"
    location = "eastus"

    tags = {
      "owner" = "tejas b"
      "project" = "Automation"
    }
}

# create 2nd resource group

resource "azurerm_resource_group" "expample_rg_blue" {
    name = "example-resource-RG2"
    location = "eastus"

    tags = {
      "owner" = "tejas b"
      "project" = "Blue-box"
      "version" = "v1.2.0"
    }
}
