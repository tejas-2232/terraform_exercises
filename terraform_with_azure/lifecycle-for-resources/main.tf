# configure microsoft azure provider
provider "azurerm" {
  features {}
  #  subscription_id = "xxxxxxxxxxxxxxxxxxxxxx"
  #  client_id = "xxxxxxxxxxxxxxxxxxxxxx"
  #  client_secret = "xxxxxxxxxxxxxxxxxxxxxx"
  #  tenant_id = "xxxxxxxxxxxxxxxxxxxxxx"
}

# create resource group
resource "azurerm_resource_group" "example_rg_blue" {
  name     = "blue-Whale-Research"
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

resource "azurerm_resource_group" "example_rg_red" {
  name     = "red-sea-Research"
  depends_on = [ azurerm_resource_group.example_rg_blue ] # BGD-GREEN-RG will execute only after BGD-Blue-RG (i.e it depends on it)
  location = "eastus"

  tags = {
    "owner"   = "tejas b"
    "project" = "Blue-box"
    "version" = "v1.2.0"
  }
  
# this will create the new resource before destroying the older one. 
# So the end user will not face any downtime for the application
  lifecycle {
    create_before_destroy = true
  }
}
