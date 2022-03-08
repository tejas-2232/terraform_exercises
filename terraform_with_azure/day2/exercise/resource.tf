# Create a resource group
resource "azurerm_resource_group" "example_rg" {
  name     = "test_rg"
  location = "eastus"

  tags = {
    Owner = "Tejas B"
  }
}

# Network Configuation
resource "azurerm_virtual_network" "example_rg" {
  name                = "example-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.example_rg.location
  resource_group_name = azurerm_resource_group.example_rg.name
}

# subnet first 10.0.2.0/24
resource "azurerm_subnet" "first" {
  name                 = "first"
  resource_group_name  = azurerm_resource_group.example_rg.name
  virtual_network_name = azurerm_virtual_network.example_rg.name
  address_prefixes     = ["10.0.2.0/24"]
}

# subnet second 10.0.3.0/24
resource "azurerm_subnet" "second" {
  name                 = "second"
  resource_group_name  = azurerm_resource_group.example_rg.name
  virtual_network_name = azurerm_virtual_network.example_rg.name
  address_prefixes     = ["10.0.3.0/24"]
}

# -------------------------------------------------

# create nic1 for back_end1
resource "azurerm_network_interface" "example_rg_1" {
  name                = "nic_1"
  location            = azurerm_resource_group.example_rg.location
  resource_group_name = azurerm_resource_group.example_rg.name

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = azurerm_subnet.first.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.first_public.id
  }
}
# Public IP Configuration
resource "azurerm_public_ip" "first_public" {
  name                = "myPublicIP_1"
  location            = "eastus"
  resource_group_name = azurerm_resource_group.example_rg.name
  allocation_method   = "Dynamic"
}
# -------------------------------------------------
# Create nic3 for backend2 vm
resource "azurerm_network_interface" "example_rg_3" {
  name     = nic_3
  location = azurerm_resource_group.example_rg.location
  resource_group_name = azurerm_resource_group.example_rg.name

  ip_configuration {
    name                            = "nic3_subnet2_IP"
    subnet_id                       = azurerm_subnet.second.id
    private_ip_address_allocation   = "Dynamic"
    public_ip_address_id            = azurerm_public_ip.third_public.id
  }
}
# Public IP Configuration for nic3 backend2
resource "azurerm_public_ip" "third_public" {
  name                = "myPublicIP_3"
  location            = "eastus"
  resource_group_name = azurerm_resource_group.example_rg.name
  allocation_method   = "Dynamic"
}
# -------------------------------------------------
# create nic2 for Frontend1
resource "azurerm_network_interface" "example_rg_2" {
  name                = "nic_2"
  location            = azurerm_resource_group.example_rg.location
  resource_group_name = azurerm_resource_group.example_rg.name

  ip_configuration {
    name                          = "testconfiguration2"
    subnet_id                     = azurerm_subnet.first.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.second_public.id
  }
}

# Public IP Configuration for nic3 Frontend1

resource "azurerm_public_ip" "second_public" {
  name                = "myPublicIP_2"
  location            = "eastus"
  resource_group_name = azurerm_resource_group.example_rg.name
  allocation_method   = "Dynamic"
}
# -------------------------------------------------

# Create nic4 for FrontEnd2 vm
resource "azurerm_network_interface" "example_rg_4" {
  name     = nic_4
  location = azurerm_resource_group.example_rg.location
  resource_group_name = azurerm_resource_group.example_rg.name

  ip_configuration {
    name                            = "nic4_subnet2_IP"
    subnet_id                       = azurerm_subnet.second.id
    private_ip_address_allocation   = "Dynamic"
    public_ip_address_id            = azurerm_public_ip.fourth__public.id
  }
}
# Public IP Configuration for nic4 FrontEnd2
resource "azurerm_public_ip" "fourth_public" {
  name                = "myPublicIP_4"
  location            = "eastus"
  resource_group_name = azurerm_resource_group.example_rg.name
  allocation_method   = "Dynamic"
}

# -------------------------------------------------

# Create Network Security Group and rule
resource "azurerm_network_security_group" "examplensg" {
  name                = "myNetworkSecurityGroup"
  location            = "eastus"
  resource_group_name = azurerm_resource_group.example_rg.name

  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

}

# Virtual Machine backend1

resource "azurerm_virtual_machine" "back_end1" {
  name                  = "back_end1"
  location              = azurerm_resource_group.example_rg.location
  resource_group_name   = azurerm_resource_group.example_rg.name
  network_interface_ids = [azurerm_network_interface.example_rg_1.id]
  vm_size               = "Standard_DS1_v2"

  delete_os_disk_on_termination    = true
  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  storage_os_disk {
    name              = "backend1disk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "example-vm"
    admin_username = "testadmin"
    admin_password = "Password1234!"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }

  tags = {
    environment = "backend1"
  }

  lifecycle {
    prevent_destroy = true
  }
}

# Virtual Machine Frontend1

resource "azurerm_virtual_machine" "front_end1" {
  name                  = "front_end1"
  location              = azurerm_resource_group.example_rg.location
  resource_group_name   = azurerm_resource_group.example_rg.name
  network_interface_ids = [azurerm_network_interface.example_rg_2.id]
  vm_size               = "Standard_DS1_v2"

  delete_os_disk_on_termination    = true
  delete_data_disks_on_termination = true


  lifecycle {
    create_before_destroy = true 
  }

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  storage_os_disk {
    name              = "frontend1disk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "example-vm"
    admin_username = "testadmin"
    admin_password = "Password1234!"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }

  tags = {
    environment = "frontend1"
  }
}

# Virtual Machine backend2

resource "azurerm_virtual_machine" "back_end2" {
  name                  = "back_end2"
  location              = azurerm_resource_group.example_rg.location
  resource_group_name   = azurerm_resource_group.example_rg.name
  network_interface_ids = [azurerm_network_interface.example_rg_3.id]
  vm_size               = "Standard_DS1_v2"

  delete_os_disk_on_termination    = true
  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  storage_os_disk {
    name              = "backend2disk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "example-vm"
    admin_username = "testadmin"
    admin_password = "Password1234!"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }

  tags = {
    environment = "backend2"
  }

  lifecycle {
    prevent_destroy = true
  }
}

# Virtual Machine Frontend2

resource "azurerm_virtual_machine" "front_end2" {
  name                  = "front_end2"
  location              = azurerm_resource_group.example_rg.location
  resource_group_name   = azurerm_resource_group.example_rg.name
  network_interface_ids = [azurerm_network_interface.example_rg_4.id]
  vm_size               = "Standard_DS1_v2"

  delete_os_disk_on_termination    = true
  delete_data_disks_on_termination = true


  lifecycle {
    create_before_destroy = true 
  }

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  storage_os_disk {
    name              = "frontend2disk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "example-vm"
    admin_username = "testadmin"
    admin_password = "Password1234!"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }

  tags = {
    environment = "frontend2"
  }
}
