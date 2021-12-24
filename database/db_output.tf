/*
output "resource_groupe" {
  value = azurerm.resource.rg.name
  }
output "resource_group_location" {
  value = azurerm_resource_group.rg.location
}
*/
output "db_server_name" {
  value = azurerm_mysql_server.mysql.name
}
output "dbserver_id" {
  value = azurerm_mysql_server.mysql.id
}
/*
output "pri_dns_name" {
  value = azurerm_private_dns_zone.dns.name
}
output "pri_dns_id" {
  value = azurerm_private_dns_zone.dns.id
}
output "vnet_id" {
  value = azurerm_virtual_network.vpc.id
}
output "dbsubnet_id" {
  value = azurerm_subnet.db_subnet.id
}
*/