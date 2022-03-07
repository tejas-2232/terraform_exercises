# configure microsoft azure provider
provider "azurerm" {
  features {}
  #  subscription_id = "xxxxxxxxxxxxxxxxxxxxxx"
  #  client_id = "xxxxxxxxxxxxxxxxxxxxxx"
  #  client_secret = "xxxxxxxxxxxxxxxxxxxxxx"
  #  tenant_id = "xxxxxxxxxxxxxxxxxxxxxx"
}

# create resource group
resource "azurerm_resource_group" "expample_rg_blue" {
  name     = "BGD-Blue-RG"
  location = "eastus"

  tags = {
    "owner"   = "tejas b"
    "team"    = "devops"
    "project" = "Automation"
  }

# this will prevent resource from being destroyed

    lifecycle {
        prevent_destroy = false
    }

}



# this will destory resources 

# lifecycle{
#     prevent_destroy = false
# }

# create 2nd resource group

resource "azurerm_resource_group" "expample_rg_red" {
  name     = "BGD-GREEN-RG"
  location = "eastus"

  tags = {
    "owner"   = "tejas b"
    "project" = "Blue-box"
    "version" = "v1.2.0"
  }
}
