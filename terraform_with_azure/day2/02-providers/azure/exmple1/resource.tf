# Create a resource group
resource "azurerm_resource_group" "example_rg_red" {
  name     = "example-resource-RG"
  location = "eastus"

 tags = { 
  owner = "Tejas B"
  team  = "DevOps"
  project = "Automation"
  }
}
