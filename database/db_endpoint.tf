# DNS zone 생성
resource "azurerm_private_dns_zone" "dns_zone" {
  name                = "privatelink.mysql.database.azure.com" 
  resource_group_name = var.resource_group
}
resource "azurerm_private_endpoint" "end" {
  name                = "${var.name}_end"
  location            = var.resource_group_location
  resource_group_name = var.resource_group
  subnet_id           = var.dbsubnet_id

  private_service_connection {
    name                           = "${var.name}_private_sc"
    private_connection_resource_id = var.dbserver_id
    is_manual_connection           = var.db-pri-ser-isconnec
    subresource_names              = ["mysqlServer"]
  }


  private_dns_zone_group {
    name                 = "private_dns_zone"
    private_dns_zone_ids = [azurerm_private_dns_zone.dns_zone.id]
  }

  depends_on = [ azurerm_mysql_configuration.db_conf ]
}




resource "azurerm_private_dns_zone_virtual_network_link" "netlink" { #내가 사용하는 vpc와 연결도 해주고~~
  name                  = "${var.name}_netlink"
  resource_group_name   = var.resource_group
  private_dns_zone_name = "privatelink.mysql.database.azure.com"
  virtual_network_id    = var.vnet_id

  depends_on = [azurerm_private_endpoint.end]
}