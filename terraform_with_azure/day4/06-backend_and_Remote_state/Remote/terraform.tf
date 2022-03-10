# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.97.0"
    }
  }
  backend "azurerm" { 
    resource_group_name  = "tstate"
    storage_account_name = "tejstate"
    container_name       = "tstate"
    key                  = "marvel7"   # name of statefile on azure
  }
}
