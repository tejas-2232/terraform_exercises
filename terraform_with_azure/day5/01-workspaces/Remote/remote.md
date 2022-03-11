
* terraform workspace select default

* terraform plan

```tf

Terraform will perform the following actions:

  # azurerm_resource_group.example_rg_red[0] will be created
  + resource "azurerm_resource_group" "example_rg_red" {
      + id       = (known after apply)
      + location = "eastus"
      + name     = "TestRG-default-1"
      + tags     = {
          + "env" = "Automation-default"
        }
    }

```


* terraform workspace new uat

* terraform plan

```tf
Terraform will perform the following actions:

  # azurerm_resource_group.example_rg_red[0] will be created
  + resource "azurerm_resource_group" "example_rg_red" {
      + id       = (known after apply)
      + location = "eastus"
      + name     = "TestRG-uat-1"
      + tags     = {
          + "env" = "Automation-uat"
        }
    }

  # azurerm_resource_group.example_rg_red[1] will be created
  + resource "azurerm_resource_group" "example_rg_red" {
      + id       = (known after apply)
      + location = "eastus"
      + name     = "TestRG-uat-2"
      + tags     = {
          + "env" = "Automation-uat"
        }
    }

Plan: 2 to add, 0 to change, 0 to destroy.
```



* terraform workspace new prod
```
Created and switched to workspace "prod"!

You're now on a new, empty workspace. Workspaces isolate their state,
so if you run "terraform plan" Terraform will not see any existing state
for this configuration.
```

* at this step, without even apply command it will create a statefile on azure. It's initialization of file

__ex:__

```tf
{
  "version": 4,
  "terraform_version": "1.1.7",
  "serial": 0,
  "lineage": "387e1336-fca6-74438a1903ad",
  "outputs": {},
  "resources": []
}
```


* `terraform plan` => creates 5 resource groups

```tf
Terraform will perform the following actions:

  # azurerm_resource_group.example_rg_red[0] will be created
  + resource "azurerm_resource_group" "example_rg_red" {
      + id       = (known after apply)
      + location = "eastus"
      + name     = "TestRG-prod-1"
      + tags     = {
          + "env" = "Automation-prod"
        }
    }

  # azurerm_resource_group.example_rg_red[1] will be created
  + resource "azurerm_resource_group" "example_rg_red" {
      + id       = (known after apply)
      + location = "eastus"
      + name     = "TestRG-prod-2"
      + tags     = {
          + "env" = "Automation-prod"
        }
    }

  # azurerm_resource_group.example_rg_red[2] will be created
  + resource "azurerm_resource_group" "example_rg_red" {
      + id       = (known after apply)
      + location = "eastus"
      + name     = "TestRG-prod-3"
      + tags     = {
          + "env" = "Automation-prod"
        }
    }

  # azurerm_resource_group.example_rg_red[3] will be created
  + resource "azurerm_resource_group" "example_rg_red" {
      + id       = (known after apply)
      + location = "eastus"
      + name     = "TestRG-prod-4"
      + tags     = {
          + "env" = "Automation-prod"
        }
    }

  # azurerm_resource_group.example_rg_red[4] will be created
  + resource "azurerm_resource_group" "example_rg_red" {
      + id       = (known after apply)
      + location = "eastus"
      + name     = "TestRG-prod-5"
      + tags     = {
          + "env" = "Automation-prod"
        }
    }

Plan: 5 to add, 0 to change, 0 to destroy.
```



