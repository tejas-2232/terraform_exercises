
* terraform init

* `terraform plan -var-file=prod.tfvars`

plan:

```tf
Terraform will perform the following actions:

  # azurerm_network_interface.example_rg will be created
  + resource "azurerm_network_interface" "example_rg" {
      + applied_dns_servers           = (known after apply)
      + dns_servers                   = (known after apply)
      + enable_accelerated_networking = false
      + enable_ip_forwarding          = false
      + id                            = (known after apply)
      + internal_dns_name_label       = (known after apply)
      + internal_domain_name_suffix   = (known after apply)
      + location                      = "eastus"
      + mac_address                   = (known after apply)
      + name                          = "production-nic"
      + private_ip_address            = (known after apply)
      + private_ip_addresses          = (known after apply)
      + resource_group_name           = "production-resources-RG"
      + virtual_machine_id            = (known after apply)

      + ip_configuration {
          + gateway_load_balancer_frontend_ip_configuration_id = (known after apply)
          + name                                               = "testconfiguration1"
          + primary                                            = (known after apply)
          + private_ip_address                                 = (known after apply)
          + private_ip_address_allocation                      = "Dynamic"
          + private_ip_address_version                         = "IPv4"
          + public_ip_address_id                               = (known after apply)
          + subnet_id                                          = (known after apply)
        }
    }

  # azurerm_network_security_group.examplensg will be created
  + resource "azurerm_network_security_group" "examplensg" {
      + id                  = (known after apply)
      + location            = "eastus"
      + name                = "production-nsg"
      + resource_group_name = "production-resources-RG"
      + security_rule       = [
          + {
              + access                                     = "Allow"
              + description                                = ""
              + destination_address_prefix                 = "*"
              + destination_address_prefixes               = []
              + destination_application_security_group_ids = []
              + destination_port_range                     = "22"
              + destination_port_ranges                    = []
              + direction                                  = "Inbound"
              + name                                       = "SSH"
              + priority                                   = 1001
              + protocol                                   = "Tcp"
              + source_address_prefix                      = "*"
              + source_address_prefixes                    = []
              + source_application_security_group_ids      = []
              + source_port_range                          = "*"
              + source_port_ranges                         = []
            },
        ]
    }

  # azurerm_public_ip.examplepublicip will be created
  + resource "azurerm_public_ip" "examplepublicip" {
      + allocation_method       = "Dynamic"
      + availability_zone       = (known after apply)
      + fqdn                    = (known after apply)
      + id                      = (known after apply)
      + idle_timeout_in_minutes = 4
      + ip_address              = (known after apply)
      + ip_version              = "IPv4"
      + location                = "eastus"
      + name                    = "myPublicIP"
      + resource_group_name     = "production-resources-RG"
      + sku                     = "Basic"
      + sku_tier                = "Regional"
      + zones                   = (known after apply)
    }

  # azurerm_resource_group.example_rg will be created
  + resource "azurerm_resource_group" "example_rg" {
      + id       = (known after apply)
      + location = "eastus"
      + name     = "production-resources-RG"
      + tags     = {
          + "Owner" = "AV"
        }
    }

  # azurerm_subnet.internal will be created
  + resource "azurerm_subnet" "internal" {
      + address_prefix                                 = (known after apply)
      + address_prefixes                               = [
          + "10.0.2.0/24",
        ]
      + enforce_private_link_endpoint_network_policies = false
      + enforce_private_link_service_network_policies  = false
      + id                                             = (known after apply)
      + name                                           = "production-internal"
      + resource_group_name                            = "production-resources-RG"
      + virtual_network_name                           = "production-network"
    }

  # azurerm_virtual_machine.example_rg will be created
  + resource "azurerm_virtual_machine" "example_rg" {
      + availability_set_id              = (known after apply)
      + delete_data_disks_on_termination = true
      + delete_os_disk_on_termination    = true
      + id                               = (known after apply)
      + license_type                     = (known after apply)
      + location                         = "eastus"
      + name                             = "production-vm"
      + network_interface_ids            = (known after apply)
      + resource_group_name              = "production-resources-RG"
      + tags                             = {
          + "environment" = "staging"
        }
      + vm_size                          = "Standard_B1s"

      + identity {
          + identity_ids = (known after apply)
          + principal_id = (known after apply)
          + type         = (known after apply)
        }

      + os_profile {
          + admin_password = (sensitive value)
          + admin_username = "admin_prod"
          + computer_name  = "example-vm"
          + custom_data    = (known after apply)
        }

      + os_profile_linux_config {
          + disable_password_authentication = false
        }

      + storage_data_disk {
          + caching                   = (known after apply)
          + create_option             = (known after apply)
          + disk_size_gb              = (known after apply)
          + lun                       = (known after apply)
          + managed_disk_id           = (known after apply)
          + managed_disk_type         = (known after apply)
          + name                      = (known after apply)
          + vhd_uri                   = (known after apply)
          + write_accelerator_enabled = (known after apply)
        }

      + storage_image_reference {
          + offer     = "UbuntuServer"
          + publisher = "Canonical"
          + sku       = "16.04-LTS"
          + version   = "latest"
        }

      + storage_os_disk {
          + caching                   = "ReadWrite"
          + create_option             = "FromImage"
          + disk_size_gb              = (known after apply)
          + managed_disk_id           = (known after apply)
          + managed_disk_type         = "Standard_LRS"
          + name                      = "myosdisk1"
          + os_type                   = (known after apply)
          + write_accelerator_enabled = false
        }
    }

  # azurerm_virtual_network.example_rg will be created
  + resource "azurerm_virtual_network" "example_rg" {
      + address_space         = [
          + "10.0.0.0/16",
        ]
      + dns_servers           = (known after apply)
      + guid                  = (known after apply)
      + id                    = (known after apply)
      + location              = "eastus"
      + name                  = "production-network"
      + resource_group_name   = "production-resources-RG"
      + subnet                = (known after apply)
      + vm_protection_enabled = false
    }

Plan: 7 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + PIP             = {
      + allocation_method       = "Dynamic"
      + availability_zone       = (known after apply)
      + domain_name_label       = null
      + fqdn                    = (known after apply)
      + id                      = (known after apply)
      + idle_timeout_in_minutes = 4
      + ip_address              = (known after apply)
      + ip_tags                 = null
      + ip_version              = "IPv4"
      + location                = "eastus"
      + name                    = "myPublicIP"
      + public_ip_prefix_id     = null
      + resource_group_name     = "production-resources-RG"
      + reverse_fqdn            = null
      + sku                     = "Basic"
      + sku_tier                = "Regional"
      + tags                    = null
      + timeouts                = null
      + zones                   = (known after apply)
    }
  + my_vm_public_ip = (known after apply)
```

* PIP will print whatever parameters present in below code snippet.

```tf
resource "azurerm_public_ip" "examplepublicip" {
    name                         = "myPublicIP"
    location                     = "eastus"
    resource_group_name          = azurerm_resource_group.example_rg.name
    allocation_method            = "Dynamic"
}
```

* Contents of `prod.tfvars` file

```tf
my_loc = "eastus"
my_rg_name = "production"
admin_username_av = "admin_prod"
admin_password =  "Password432!"
```

* Now use apply command-> `terraform apply -var-file=prod.tfvars`

```
Terraform will perform the following actions:

  # azurerm_network_interface.example_rg will be created
  + resource "azurerm_network_interface" "example_rg" {
      + applied_dns_servers           = (known after apply)
      + dns_servers                   = (known after apply)
      + enable_accelerated_networking = false
      + enable_ip_forwarding          = false
      + id                            = (known after apply)
      + internal_dns_name_label       = (known after apply)
      + internal_domain_name_suffix   = (known after apply)
      + location                      = "eastus"
      + mac_address                   = (known after apply)
      + name                          = "production-nic"
      + private_ip_address            = (known after apply)
      + private_ip_addresses          = (known after apply)
      + resource_group_name           = "production-resources-RG"
      + virtual_machine_id            = (known after apply)

      + ip_configuration {
          + gateway_load_balancer_frontend_ip_configuration_id = (known after apply)
          + name                                               = "testconfiguration1"
          + primary                                            = (known after apply)
          + private_ip_address                                 = (known after apply)
          + private_ip_address_allocation                      = "Dynamic"
          + private_ip_address_version                         = "IPv4"
          + public_ip_address_id                               = (known after apply)
          + subnet_id                                          = (known after apply)
        }
    }

  # azurerm_network_security_group.examplensg will be created
  + resource "azurerm_network_security_group" "examplensg" {
      + id                  = (known after apply)
      + location            = "eastus"
      + name                = "production-nsg"
      + resource_group_name = "production-resources-RG"
      + security_rule       = [
          + {
              + access                                     = "Allow"
              + description                                = ""
              + destination_address_prefix                 = "*"
              + destination_address_prefixes               = []
              + destination_application_security_group_ids = []
              + destination_port_range                     = "22"
              + destination_port_ranges                    = []
              + direction                                  = "Inbound"
              + name                                       = "SSH"
              + priority                                   = 1001
              + protocol                                   = "Tcp"
              + source_address_prefix                      = "*"
              + source_address_prefixes                    = []
              + source_application_security_group_ids      = []
              + source_port_range                          = "*"
              + source_port_ranges                         = []
            },
        ]
    }

  # azurerm_public_ip.examplepublicip will be created
  + resource "azurerm_public_ip" "examplepublicip" {
      + allocation_method       = "Dynamic"
      + availability_zone       = (known after apply)
      + fqdn                    = (known after apply)
      + id                      = (known after apply)
      + idle_timeout_in_minutes = 4
      + ip_address              = (known after apply)
      + ip_version              = "IPv4"
      + location                = "eastus"
      + name                    = "myPublicIP"
      + resource_group_name     = "production-resources-RG"
      + sku                     = "Basic"
      + sku_tier                = "Regional"
      + zones                   = (known after apply)
    }

  # azurerm_resource_group.example_rg will be created
  + resource "azurerm_resource_group" "example_rg" {
      + id       = (known after apply)
      + location = "eastus"
      + name     = "production-resources-RG"
      + tags     = {
          + "Owner" = "AV"
        }
    }

  # azurerm_subnet.internal will be created
  + resource "azurerm_subnet" "internal" {
      + address_prefix                                 = (known after apply)
      + address_prefixes                               = [
          + "10.0.2.0/24",
        ]
      + enforce_private_link_endpoint_network_policies = false
      + enforce_private_link_service_network_policies  = false
      + id                                             = (known after apply)
      + name                                           = "production-internal"
      + resource_group_name                            = "production-resources-RG"
      + virtual_network_name                           = "production-network"
    }

  # azurerm_virtual_machine.example_rg will be created
  + resource "azurerm_virtual_machine" "example_rg" {
      + availability_set_id              = (known after apply)
      + delete_data_disks_on_termination = true
      + delete_os_disk_on_termination    = true
      + id                               = (known after apply)
      + license_type                     = (known after apply)
      + location                         = "eastus"
      + name                             = "production-vm"
      + network_interface_ids            = (known after apply)
      + resource_group_name              = "production-resources-RG"
      + tags                             = {
          + "environment" = "staging"
        }
      + vm_size                          = "Standard_B1s"

      + identity {
          + identity_ids = (known after apply)
          + principal_id = (known after apply)
          + type         = (known after apply)
        }

      + os_profile {
          + admin_password = (sensitive value)
          + admin_username = "admin_prod"
          + computer_name  = "example-vm"
          + custom_data    = (known after apply)
        }

      + os_profile_linux_config {
          + disable_password_authentication = false
        }

      + storage_data_disk {
          + caching                   = (known after apply)
          + create_option             = (known after apply)
          + disk_size_gb              = (known after apply)
          + lun                       = (known after apply)
          + managed_disk_id           = (known after apply)
          + managed_disk_type         = (known after apply)
          + name                      = (known after apply)
          + vhd_uri                   = (known after apply)
          + write_accelerator_enabled = (known after apply)
        }

      + storage_image_reference {
          + offer     = "UbuntuServer"
          + publisher = "Canonical"
          + sku       = "16.04-LTS"
          + version   = "latest"
        }

      + storage_os_disk {
          + caching                   = "ReadWrite"
          + create_option             = "FromImage"
          + disk_size_gb              = (known after apply)
          + managed_disk_id           = (known after apply)
          + managed_disk_type         = "Standard_LRS"
          + name                      = "myosdisk1"
          + os_type                   = (known after apply)
          + write_accelerator_enabled = false
        }
    }

  # azurerm_virtual_network.example_rg will be created
  + resource "azurerm_virtual_network" "example_rg" {
      + address_space         = [
          + "10.0.0.0/16",
        ]
      + dns_servers           = (known after apply)
      + guid                  = (known after apply)
      + id                    = (known after apply)
      + location              = "eastus"
      + name                  = "production-network"
      + resource_group_name   = "production-resources-RG"
      + subnet                = (known after apply)
      + vm_protection_enabled = false
    }

Plan: 7 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + PIP             = {
      + allocation_method       = "Dynamic"
      + availability_zone       = (known after apply)
      + domain_name_label       = null
      + fqdn                    = (known after apply)
      + id                      = (known after apply)
      + idle_timeout_in_minutes = 4
      + ip_address              = (known after apply)
      + ip_tags                 = null
      + ip_version              = "IPv4"
      + location                = "eastus"
      + name                    = "myPublicIP"
      + public_ip_prefix_id     = null
      + resource_group_name     = "production-resources-RG"
      + reverse_fqdn            = null
      + sku                     = "Basic"
      + sku_tier                = "Regional"
      + tags                    = null
      + timeouts                = null
      + zones                   = (known after apply)
    }
  + my_vm_public_ip = (known after apply)

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

azurerm_resource_group.example_rg: Creating...
azurerm_resource_group.example_rg: Creation complete after 3s [id=/subscriptions/id/resourceGroups/production-resources-RG]
azurerm_virtual_network.example_rg: Creating...
azurerm_network_security_group.examplensg: Creating...
azurerm_public_ip.examplepublicip: Creating...
azurerm_virtual_network.example_rg: Still creating... [10s elapsed]
azurerm_public_ip.examplepublicip: Still creating... [10s elapsed]
azurerm_network_security_group.examplensg: Still creating... [10s elapsed]
azurerm_public_ip.examplepublicip: Creation complete after 11s [id=/subscriptions/id/resourceGroups/production-resources-RG/providers/Microsoft.Network/publicIPAddresses/myPublicIP]
azurerm_network_security_group.examplensg: Creation complete after 11s [id=/subscriptions/id/resourceGroups/production-resources-RG/providers/Microsoft.Network/networkSecurityGroups/production-nsg]
azurerm_virtual_network.example_rg: Creation complete after 16s [id=/subscriptions/id/resourceGroups/production-resources-RG/providers/Microsoft.Network/virtualNetworks/production-network]
azurerm_subnet.internal: Creating...
azurerm_subnet.internal: Creation complete after 7s [id=/subscriptions/id/resourceGroups/production-resources-RG/providers/Microsoft.Network/virtualNetworks/production-network/subnets/production-internal]
azurerm_network_interface.example_rg: Creating...
azurerm_network_interface.example_rg: Creation complete after 6s [id=/subscriptions/id/resourceGroups/production-resources-RG/providers/Microsoft.Network/networkInterfaces/production-nic]
azurerm_virtual_machine.example_rg: Creating...
azurerm_virtual_machine.example_rg: Still creating... [10s elapsed]
azurerm_virtual_machine.example_rg: Still creating... [20s elapsed]
azurerm_virtual_machine.example_rg: Still creating... [30s elapsed]
azurerm_virtual_machine.example_rg: Still creating... [40s elapsed]
azurerm_virtual_machine.example_rg: Still creating... [50s elapsed]
azurerm_virtual_machine.example_rg: Creation complete after 59s [id=/subscriptions/id/resourceGroups/production-resources-RG/providers/Microsoft.Compute/virtualMachines/production-vm]

Apply complete! Resources: 7 added, 0 changed, 0 destroyed.

Outputs:

PIP = {
  "allocation_method" = "Dynamic"
  "availability_zone" = "No-Zone"
  "domain_name_label" = tostring(null)
  "fqdn" = tostring(null)
  "id" = "/subscriptions/<id>/resourceGroups/production-resources-RG/providers/Microsoft.Network/publicIPAddresses/myPublicIP"
  "idle_timeout_in_minutes" = 4
  "ip_address" = ""
  "ip_tags" = tomap(null) /* of string */
  "ip_version" = "IPv4"
  "location" = "eastus"
  "name" = "myPublicIP"
  "public_ip_prefix_id" = tostring(null)
  "resource_group_name" = "production-resources-RG"
  "reverse_fqdn" = tostring(null)
  "sku" = "Basic"
  "sku_tier" = "Regional"
  "tags" = tomap(null) /* of string */
  "timeouts" = null /* object */
  "zones" = tolist([])
}
my_vm_public_ip = ""
```





* Check what is present in PIP output => `terraform output PIP`

```
{
  "allocation_method" = "Dynamic"
  "availability_zone" = "No-Zone"
  "domain_name_label" = tostring(null)
  "fqdn" = tostring(null)
  "id" = "/subscriptions/id/resourceGroups/production-resources-RG/providers/Microsoft.Network/publicIPAddresses/myPublicIP"
  "idle_timeout_in_minutes" = 4
  "ip_address" = ""
  "ip_tags" = tomap(null) /* of string */
  "ip_version" = "IPv4"
  "location" = "eastus"
  "name" = "myPublicIP"
  "public_ip_prefix_id" = tostring(null)
  "resource_group_name" = "production-resources-RG"
  "reverse_fqdn" = tostring(null)
  "sku" = "Basic"
  "sku_tier" = "Regional"
  "tags" = tomap(null) /* of string */
  "timeouts" = null /* object */
  "zones" = tolist([])
}
```

* do Terraform refresh -> `terraform refresh -var-file=prod.tfvars` -> This will give you the ip address

```
Outputs:

PIP = {
  "allocation_method" = "Dynamic"
  "availability_zone" = "No-Zone"
  "domain_name_label" = tostring(null)
  "fqdn" = tostring(null)
  "id" = "/subscriptions/id/resourceGroups/production-resources-RG/providers/Microsoft.Network/publicIPAddresses/myPublicIP"
  "idle_timeout_in_minutes" = 4
  "ip_address" = "40.121.162.9"
  "ip_tags" = tomap({})
  "ip_version" = "IPv4"
  "location" = "eastus"
  "name" = "myPublicIP"
  "public_ip_prefix_id" = tostring(null)
  "resource_group_name" = "production-resources-RG"
  "reverse_fqdn" = tostring(null)
  "sku" = "Basic"
  "sku_tier" = "Regional"
  "tags" = tomap({})
  "timeouts" = null /* object */
  "zones" = tolist([])
}
my_vm_public_ip = "1.10.0.9"

```


* `my_vm_public_ip` will print the public ip of vm only after we do `terraform refresh`

<hr>

* To fetch only Public IP --> `terraform output my_vm_public_ip`

__output:__

```
"1.10.0.9"
```

* Every time you change `output.tf` file -> do `terraform refresh -var-file=prod.tfvars` for change to take effect


> Perform `terraform destroy -var-file=prod.tfvars` to destroy the resources
