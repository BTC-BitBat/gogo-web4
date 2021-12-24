# Web 가상머신 서브넷 인터페이스 생성
resource "azurerm_network_interface" "web_vm_z1_1nif" {
  name                = "${var.name}_web_vm_nif1"
  location            = var.location
  resource_group_name = var.resource_group

  ip_configuration {
    name                          = var.web_vm_z1_1pub
    subnet_id                     = var.websubnet_id
    private_ip_address_allocation = var.web_ipcfg_allo
  }
  
}
resource "azurerm_network_interface" "web_vm_z1_2nif" {
  name                = "${var.name}_web_vm_nif2"
  location            = var.location
  resource_group_name = var.resource_group

  ip_configuration {
    name                          = var.web_vm_z1_2pub
    subnet_id                     = var.websubnet_id
    private_ip_address_allocation = var.web_ipcfg_allo
  }
  
}
resource "azurerm_network_interface" "web_vm_z2_1nif" {
  name                = "${var.name}_web_vm_nif3"
  location            = var.location
  resource_group_name = var.resource_group

  ip_configuration {
    name                          = var.web_vm_z2_1pub
    subnet_id                     = var.websubnet_id
    private_ip_address_allocation = var.web_ipcfg_allo
  }
  
}
resource "azurerm_network_interface" "web_vm_z2_2nif" {
  name                = "${var.name}_web_vm_nif4"
  location            = var.location
  resource_group_name = var.resource_group

  ip_configuration {
    name                          = var.web_vm_z2_2pub
    subnet_id                     = var.websubnet_id
    private_ip_address_allocation = var.web_ipcfg_allo
  }
  
}
