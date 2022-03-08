# Create a resource group
resource "azurerm_resource_group" "example_rg_red" {
  name     = var.my_rg_name
  location = var.my_loc

 tags = { 
  owner = "Tejas B"
  team  = "DevOps"
  project = "Automation"
  }
}
