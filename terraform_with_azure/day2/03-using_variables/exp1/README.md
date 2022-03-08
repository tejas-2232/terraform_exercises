
* terraform init

* terraform plan

```
Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # azurerm_resource_group.example_rg_red will be created
  + resource "azurerm_resource_group" "example_rg_red" {
      + id       = (known after apply)
      + location = "eastus"
      + name     = "TestRG"
      + tags     = {
          + "owner"   = "Tejas B"
          + "project" = "Automation"
          + "team"    = "DevOps"
        }
    }

Plan: 1 to add, 0 to change, 0 to destroy.
```

* using TF_VARS	`TF_VAR_my_rg_name=ans terraform plan`

plan:
```
Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # azurerm_resource_group.example_rg_red will be created
  + resource "azurerm_resource_group" "example_rg_red" {
      + id       = (known after apply)
      + location = "eastus"
      + name     = "ans"
      + tags     = {
          + "owner"   = "Tejas B"
          + "project" = "Automation"
          + "team"    = "DevOps"
        }
    }

Plan: 1 to add, 0 to change, 0 to destroy
```


* using two variables in TF_VARS `TF_VAR_my_rg_name=ans TF_VAR_my_loc=westus terraform plan`

plan:
```
Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # azurerm_resource_group.example_rg_red will be created
  + resource "azurerm_resource_group" "example_rg_red" {
      + id       = (known after apply)
      + location = "westus"
      + name     = "ans"
      + tags     = {
          + "owner"   = "Tejas B"
          + "project" = "Automation"
          + "team"    = "DevOps"
        }
    }

Plan: 1 to add, 0 to change, 0 to destroy.
```
<hr>

__Now we will use .tfvars file to pass vars in command line__

Two tfvars files => <br>

1. uat.tfvars

```tf
my_loc = "eastus"
my_rg_name = "UAT_RG"
```


2. prod.tfvars

```tf
my_loc = "westus"
my_rg_name = "Prod_RG"
```

* using tfvars-> `terraform plan -var-file=uat.tfvars `

```
Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # azurerm_resource_group.example_rg_red will be created
  + resource "azurerm_resource_group" "example_rg_red" {
      + id       = (known after apply)
      + location = "eastus"
      + name     = "UAT_RG"
      + tags     = {
          + "owner"   = "Tejas B"
          + "project" = "Automation"
          + "team"    = "DevOps"
        }
    }

Plan: 1 to add, 0 to change, 0 to destroy.
```


* using prod.tfvars - > ` terraform plan -var-file=prod.tfvars`


```
Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # azurerm_resource_group.example_rg_red will be created
  + resource "azurerm_resource_group" "example_rg_red" {
      + id       = (known after apply)
      + location = "westus"
      + name     = "Prod_RG"
      + tags     = {
          + "owner"   = "Tejas B"
          + "project" = "Automation"
          + "team"    = "DevOps"
        }
    }

Plan: 1 to add, 0 to change, 0 to destroy.
```


