output "PIP" {
  value = azurerm_public_ip.examplepublicip
}

output "my_vm_public_ip" {
  value = azurerm_public_ip.examplepublicip.ip_address
}
