resource "azurerm_virtual_network" "vpc" {
  name                = "${var.name}_vpc"
  resource_group_name = var.resource_group
  location            = var.location
  address_space       = [var.vnetcidr]
}
resource "azurerm_subnet" "web_subnet" {
  name                 = "${var.name}_web_sub"
  resource_group_name  = var.resource_group
  virtual_network_name = var.virtual_network_name
  address_prefixes       = [var.websubnetcidr]
}

resource "azurerm_subnet" "was_subnet" {
  name                 = "${var.name}_was_sunbet"
  resource_group_name  = var.resource_group
  virtual_network_name = var.virtual_network_name
  address_prefixes       = [var.wassubnetcidr]
}
resource "azurerm_subnet" "db_subnet" {
  name                 = "${var.name}_db_subnet"
  resource_group_name  = var.resource_group
  virtual_network_name = var.virtual_network_name
  address_prefixes      = [var.dbsubnetcidr]
  enforce_private_link_endpoint_network_policies = true
}

resource "azurerm_subnet" "AzureBastionSubnet" { #애저베스천 사용을 위해선 무조건 AzureBastionSubnet 사용
  name                 = "AzureBastionSubnet"
  resource_group_name  = var.resource_group
  virtual_network_name = var.virtual_network_name
  address_prefixes     = [var.bassubnetcidr] #IP주소d
}


resource "azurerm_subnet" "img_subnet" {
  name                 = "${var.name}_img_subnet"
  resource_group_name  = var.resource_group
  virtual_network_name = var.virtual_network_name
  address_prefixes      = [var.imgsubnetcidr]
}