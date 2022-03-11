* run terraform init

* create uat workspace

```tf
Created and switched to workspace "uat"!

You're now on a new, empty workspace. Workspaces isolate their state,
so if you run "terraform plan" Terraform will not see any existing state
for this configuration.
```

* content of resource file

```tf
# Create a resource group
resource "azurerm_resource_group" "example_rg_red" {
  name     = "${var.my_rg_name}-${terraform.workspace}-${count.index +1}"
  location = var.my_loc
  count = lookup(var.rg_count, terraform.workspace)

 tags = { 
  env = "Automation-${terraform.workspace}"
  }
}
```

* Content of variable.tf file


```tf
variable "my_loc" { 
  default = "eastus"
}


variable "my_rg_name" {
 default = "TestRG"
}

variable "rg_count" { 
 type = map
 default = { 
   default = "1"
   uat     = "2"
   prod    = "5"
 }
}

```

* plan of default workspace
  * it will create RG with name: `TestRG-default-1`

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


* creating 2 new workspaces
  1. uat 
  2. prod

1. uat

* `terraform workspace select uat`
* ` terraform plan`

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

2. prod

* create new workspace `terraform workspace new pord`


```tf

Created and switched to workspace "prod"!

You're now on a new, empty workspace. Workspaces isolate their state,
so if you run "terraform plan" Terraform will not see any existing state
for this configuration.
```

* `terraform plan`

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



