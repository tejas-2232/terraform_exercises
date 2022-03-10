# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.97.0"
    }
  }

# statefile is stored in other location rathar than pwd so here backend is on local but file is on remote location
#
  backend "local" { 
    path = "/var/tmp/terraform-backend-demo/terraform.tfstate"
  }
}
