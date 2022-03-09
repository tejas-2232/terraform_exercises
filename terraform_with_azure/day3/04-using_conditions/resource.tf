resource "azurerm_resource_group" "rg" {
    name = "RG-${var.system}-${count.index}"
    location = var.location[count.index]
    count    = var.multi-region-deployment ? 4 : 2
    tags = {
        environment = "Terraform demo"
    } 

}
