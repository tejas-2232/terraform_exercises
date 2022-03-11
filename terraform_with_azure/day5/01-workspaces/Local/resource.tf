# Create a resource group
resource "azurerm_resource_group" "example_rg_red" {
  name     = "${var.my_rg_name}-${terraform.workspace}-${count.index +1}"
  location = var.my_loc
  count = lookup(var.rg_count, terraform.workspace)

 tags = { 
  env = "Automation-${terraform.workspace}"
  }
}
