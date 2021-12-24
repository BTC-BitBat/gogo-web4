resource "azurerm_linux_virtual_machine" "web_z1_1" {
  name                            = "${var.name}_web_z1_1"
  location                        = var.location
  resource_group_name             = var.resource_group
  network_interface_ids           = [azurerm_network_interface.web_vm_z1_1nif.id]
  size                            = var.web-vm-size #VM 크기
  admin_username                  = var.webvm-username
  computer_name                   = var.webvm-comname
  admin_password                  = var.webvm_passwd
  disable_password_authentication = false
  zone = 1
  boot_diagnostics {
    storage_account_uri = null
  }

  /* admin_ssh_key {
    username   = var.webvm-sshkey-user
    public_key = file("../../.ssh/id_rsa.pub")
  }
*/


  source_image_reference {
    publisher = var.webvm-img-pub
    offer     = var.webvm-img-off
    sku       = var.webvm-img-sku
    version   = var.webvm-img-ver
  }
  os_disk {
    caching              = var.webvm-disk-cach
    storage_account_type = var.webvm-disk-type
    name                 = "${var.name}_web_vm_z11_disk"
  }
  depends_on = [
    azurerm_network_interface.web_vm_z1_1nif
  ]
 
}
resource "azurerm_linux_virtual_machine" "web_z1_2" {
  name                            = "${var.name}_web_z1_2"
  location                        = var.location
  resource_group_name             = var.resource_group
  network_interface_ids           = [azurerm_network_interface.web_vm_z1_2nif.id]
  size                            = var.web-vm-size #VM 크기
  admin_username                  = var.webvm-username
  computer_name                   = var.webvm-comname
  admin_password                  = var.webvm_passwd
  disable_password_authentication = false
  zone = 2
  boot_diagnostics {
    storage_account_uri = null
  }

  /* admin_ssh_key {
    username   = var.webvm-sshkey-user
    public_key = file("../../.ssh/id_rsa.pub")
  }
*/


  source_image_reference {
    publisher = var.webvm-img-pub
    offer     = var.webvm-img-off
    sku       = var.webvm-img-sku
    version   = var.webvm-img-ver
  }
  os_disk {
    caching              = var.webvm-disk-cach
    storage_account_type = var.webvm-disk-type
    name                 = "${var.name}_web_vm_z12_disk"
  }
  depends_on = [
    azurerm_network_interface.web_vm_z1_2nif
  ]
 
}
resource "azurerm_linux_virtual_machine" "web_z2_1" {
  name                            = "${var.name}_web_z2_1"
  location                        = var.location
  resource_group_name             = var.resource_group
  network_interface_ids           = [azurerm_network_interface.web_vm_z2_1nif.id]
  size                            = var.web-vm-size #VM 크기
  admin_username                  = var.webvm-username
  computer_name                   = var.webvm-comname
  admin_password                  = var.webvm_passwd
  disable_password_authentication = false
  zone = 1
  boot_diagnostics {
    storage_account_uri = null
  }

  /* admin_ssh_key {
    username   = var.webvm-sshkey-user
    public_key = file("../../.ssh/id_rsa.pub")
  }
*/


  source_image_reference {
    publisher = var.webvm-img-pub
    offer     = var.webvm-img-off
    sku       = var.webvm-img-sku
    version   = var.webvm-img-ver
  }
  os_disk {
    caching              = var.webvm-disk-cach
    storage_account_type = var.webvm-disk-type
    name                 = "${var.name}_web_vm_z21_disk"
  }
  depends_on = [
    azurerm_network_interface.web_vm_z2_1nif
  ]
 
}
resource "azurerm_linux_virtual_machine" "web_z2_2" {
  name                            = "${var.name}_web_z2_2"
  location                        = var.location
  resource_group_name             = var.resource_group
  network_interface_ids           = [azurerm_network_interface.web_vm_z2_2nif.id]
  size                            = var.web-vm-size #VM 크기
  admin_username                  = var.webvm-username
  computer_name                   = var.webvm-comname
  admin_password                  = var.webvm_passwd
  disable_password_authentication = false
  zone = 2
  boot_diagnostics {
    storage_account_uri = null
  }

  /* admin_ssh_key {
    username   = var.webvm-sshkey-user
    public_key = file("../../.ssh/id_rsa.pub")
  }
*/


  source_image_reference {
    publisher = var.webvm-img-pub
    offer     = var.webvm-img-off
    sku       = var.webvm-img-sku
    version   = var.webvm-img-ver
  }
  os_disk {
    caching              = var.webvm-disk-cach
    storage_account_type = var.webvm-disk-type
    name                 = "${var.name}_web_vm_z22_disk"
  }
  depends_on = [
    azurerm_network_interface.web_vm_z2_2nif
  ]
 
}