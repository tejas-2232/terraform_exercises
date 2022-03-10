
## Local

* This is how `terraform.tf` file looks

```tf
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
```


* after running `terraform init` it will show the following o/p

```tf
Initializing the backend...

Successfully configured the backend "local"! Terraform will automatically
use this backend unless the backend configuration changes.

Initializing provider plugins...
- Finding hashicorp/azurerm versions matching "2.97.0"...
- Installing hashicorp/azurerm v2.97.0...
- Installed hashicorp/azurerm v2.97.0 (signed by HashiCorp)

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

Terraform has been successfully initialized!
```

<hr>


## Remote


* Run setup_backend.sh script

* Script will create-
  * resource group : tstate
  * storage account with name: tejstate
  * container name: tstate 

```sh
#!/bin/bash

RESOURCE_GROUP_NAME=tstate
STORAGE_ACCOUNT_NAME=tejstate$RANDOM
CONTAINER_NAME=tstate

# Create resource group
az group create --name $RESOURCE_GROUP_NAME --location eastus

# Create storage account
az storage account create --resource-group $RESOURCE_GROUP_NAME --name $STORAGE_ACCOUNT_NAME --sku Standard_LRS --encryption-services blob

# Get storage account key
ACCOUNT_KEY=$(az storage account keys list --resource-group $RESOURCE_GROUP_NAME --account-name $STORAGE_ACCOUNT_NAME --query '[0].value' -o tsv)

# Create blob container
az storage container create --name $CONTAINER_NAME --account-name $STORAGE_ACCOUNT_NAME --account-key $ACCOUNT_KEY

echo "storage_account_name: $STORAGE_ACCOUNT_NAME"
echo "container_name: $CONTAINER_NAME"
echo "access_key: $ACCOUNT_KEY"
```

* Go to storage account `tejstate` in `tstate` resource group
* click on `Containers`=> click on `tstate container` ==> you will see a statefile


* __Now run `terraform init' command__

```tf
Initializing the backend...

Successfully configured the backend "azurerm"! Terraform will automatically
use this backend unless the backend configuration changes.

Initializing provider plugins...
- Finding hashicorp/azurerm versions matching "2.97.0"...
- Installing hashicorp/azurerm v2.97.0...
- Installed hashicorp/azurerm v2.97.0 (signed by HashiCorp)

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

Terraform has been successfully initialized!
```

* Next, run `terraform apply --auto-approve`

```tf

Acquiring state lock. This may take a few moments...

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # azurerm_resource_group.example_rg_red will be created
  + resource "azurerm_resource_group" "example_rg_red" {
      + id       = (known after apply)
      + location = "eastus"
      + name     = "example-resource-RG"
      + tags     = {
          + "owner"   = "TB"
          + "project" = "Automation"
        }
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

azurerm_resource_group.example_rg_red: Creating...
azurerm_resource_group.example_rg_red: Creation complete after 3s [id=/subscriptions/id/resourceGroups/example-resource-RG]
Releasing state lock. This may take a few moments...

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
```

