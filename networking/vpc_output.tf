output "network_name" {
  value = azurerm_virtual_network.vpc.name
}
output "websubnet_id" {
  value = azurerm_subnet.web_subnet.id
}
output "wassubnet_id" {
    value = azurerm_subnet.was_subnet.id  
}
output "dbsubnet_id" {
  value = azurerm_subnet.db_subnet.id
}

output "imgsubnet_id" {
  value = azurerm_subnet.img_subnet.id
}

output "bastion_id" {
  value = azurerm_subnet.AzureBastionSubnet.id
}
output "vnet_id" {
  value = azurerm_virtual_network.vpc.id
}
