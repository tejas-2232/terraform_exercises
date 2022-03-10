################### WEST US#########################################

# Create a resource group
resource "azurerm_resource_group" "west_rg" {
  name     = "tejas_west_rg"
  location = "westus"
  tags = {
    Owner = "Tejas B"
  }
}

# Network Configuation
resource "azurerm_virtual_network" "west_rg" {
  name                = "example-network"
  address_space       = ["10.1.0.0/16"]
  location            = azurerm_resource_group.west_rg.location
  resource_group_name = azurerm_resource_group.west_rg.name
}

# subnet first 10.1.4.0/24
resource "azurerm_subnet" "sub1" {
  name                 = "first"
  resource_group_name  = azurerm_resource_group.west_rg.name
  virtual_network_name = azurerm_virtual_network.west_rg.name
  address_prefixes     = ["10.1.4.0/24"]
}

# subnet second 10.1.5.0/24
resource "azurerm_subnet" "sub2" {
  name                 = "second"
  resource_group_name  = azurerm_resource_group.west_rg.name
  virtual_network_name = azurerm_virtual_network.west_rg.name
  address_prefixes     = ["10.1.5.0/24"]
}
# -------------------------------------------------

# create nic1_west for back_end1
resource "azurerm_network_interface" "west_rg_1" {
  name                = "nic1_west"
  location            = azurerm_resource_group.west_rg.location
  resource_group_name = azurerm_resource_group.west_rg.name

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = azurerm_subnet.sub1.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.first_public_west.id
  }
}
# Public IP Configuration
resource "azurerm_public_ip" "first_public_west" {
  name                = "myPublicIP_1_backend1"
  location            = "westus"
  resource_group_name = azurerm_resource_group.west_rg.name
  allocation_method   = "Dynamic"
}
# -------------------------------------------------

# Create nic3_west for backend2 vm
resource "azurerm_network_interface" "west_rg_3" {
  name     = "nic3_west"
  location = azurerm_resource_group.west_rg.location
  resource_group_name = azurerm_resource_group.west_rg.name
  ip_configuration {
    name                            = "nic3_subnet2_IP_west"
    subnet_id                       = azurerm_subnet.sub2.id
    private_ip_address_allocation   = "Dynamic"
    public_ip_address_id            = azurerm_public_ip.third_public_west.id
  }
}
# Public IP Configuration for nic3 backend2
resource "azurerm_public_ip" "third_public_west" {
  name                = "myPublicIP_3_backend2"
  location            = "westus"
  resource_group_name = azurerm_resource_group.west_rg.name
  allocation_method   = "Dynamic"
}
# -------------------------------------------------
# create nic2_west for Frontend1
resource "azurerm_network_interface" "west_rg_2" {
  name                = "nic2_west"
  location            = azurerm_resource_group.west_rg.location
  resource_group_name = azurerm_resource_group.west_rg.name

  ip_configuration {
    name                          = "testconfiguration2"
    subnet_id                     = azurerm_subnet.sub1.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.second_public_west.id
  }
}
# Public IP Configuration for nic2_west Frontend1
resource "azurerm_public_ip" "second_public_west" {
  name                = "myPublicIP_2_frontend1"
  location            = "westus"
  resource_group_name = azurerm_resource_group.west_rg.name
  allocation_method   = "Dynamic"
}
# -------------------------------------------------

# Create nic4_west for FrontEnd2 vm
resource "azurerm_network_interface" "west_rg_4" {
  name     = "nic4_west"
  location = azurerm_resource_group.west_rg.location
  resource_group_name = azurerm_resource_group.west_rg.name

  ip_configuration {
    name                            = "nic4_subnet2_IP_west"
    subnet_id                       = azurerm_subnet.sub2.id
    private_ip_address_allocation   = "Dynamic"
    public_ip_address_id            = azurerm_public_ip.fourth_public_west.id
  }
}
# Public IP Configuration for nic4_west FrontEnd2
resource "azurerm_public_ip" "fourth_public_west" {
  name                = "myPublicIP_4_frontend2"
  location            = "westus"
  resource_group_name = azurerm_resource_group.west_rg.name
  allocation_method   = "Dynamic"
}

# -------------------------------------------------

# Create Network Security Group and rule
resource "azurerm_network_security_group" "examplensg_west" {
  name                = "myNetworkSecurityGroup_west"
  location            = "westus"
  resource_group_name = azurerm_resource_group.west_rg.name

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
resource "azurerm_virtual_machine" "backend1_west" {
  name                  = "backend1_wst"
  location              = azurerm_resource_group.west_rg.location
  resource_group_name   = azurerm_resource_group.west_rg.name
  network_interface_ids = [azurerm_network_interface.west_rg_1.id]
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
    name              = "backend1disk1_west"
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
    environment = "backend1_west"
  }

  lifecycle {
    prevent_destroy = true
  }
}

# Virtual Machine Frontend1

resource "azurerm_virtual_machine" "frontend1_west" {
  name                  = "frontend1_wst"
  location              = azurerm_resource_group.west_rg.location
  resource_group_name   = azurerm_resource_group.west_rg.name
  network_interface_ids = [azurerm_network_interface.west_rg_2.id]
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
    name              = "frontend1disk1_west"
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
    environment = "frontend1_west"
  }
}

# Virtual Machine backend2_west

resource "azurerm_virtual_machine" "backend2_west" {
  name                  = "backend2_wst"
  location              = azurerm_resource_group.west_rg.location
  resource_group_name   = azurerm_resource_group.west_rg.name
  network_interface_ids = [azurerm_network_interface.west_rg_3.id]
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
    name              = "backend2disk1_west"
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

# Virtual Machine Frontend2 west

resource "azurerm_virtual_machine" "frontend2_west" {
  name                  = "frontend2_wst"
  location              = azurerm_resource_group.west_rg.location
  resource_group_name   = azurerm_resource_group.west_rg.name
  network_interface_ids = [azurerm_network_interface.west_rg_4.id]
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
    name              = "frontend2disk1_west"
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
