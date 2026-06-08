output "azure_public_ip" {
  value = azurerm_public_ip.public_ip.ip_address
}

output "azure_vm_name" {
  value = azurerm_linux_virtual_machine.vm.name
}

output "resource_group_name" {
  value = data.azurerm_resource_group.rg.name
}
