# Web security group과 web subnet 합침
resource "azurerm_subnet_network_security_group_association" "nsgass_web" {
  subnet_id                 = var.websubnet_id
  network_security_group_id = azurerm_network_security_group.nsg_web.id
  depends_on = [
    azurerm_network_security_group.nsg_web
  ]
}


# Was security group과 was subnet 합침
resource "azurerm_subnet_network_security_group_association" "nsgass_was" {
  subnet_id                 = var.wassubnet_id
  network_security_group_id = azurerm_network_security_group.nsg_was.id
  depends_on = [
    azurerm_network_security_group.nsg_was
  ]
}

# DB security group과 DB subnet 합침
resource "azurerm_subnet_network_security_group_association" "nsgass_db" {
  subnet_id                 = var.dbsubnet_id
  network_security_group_id = azurerm_network_security_group.nsg_db.id
  depends_on = [
    azurerm_network_security_group.nsg_db
  ]
}

# Was_img security group과 Was_img subnet 합침
resource "azurerm_subnet_network_security_group_association" "nsgass_img" {
  subnet_id                 = var.imgsubnet_id
  network_security_group_id = azurerm_network_security_group.nsg_img.id
  depends_on = [
    azurerm_network_security_group.nsg_img
  ]
}