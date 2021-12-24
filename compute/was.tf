resource "azurerm_public_ip" "was_pubip" {
  name                = "${var.name}-was-publicip"
  resource_group_name = var.resource_group
  location            = var.location
  allocation_method   = var.was-pubip-allo
}

resource "azurerm_network_interface" "was_nwif" {
  name                = "${var.name}_was_nwif"
  location            = var.location
  resource_group_name = var.resource_group

  ip_configuration {
    name                          = "internal2"
    subnet_id                     = var.imgsubnet_id
    public_ip_address_id          = azurerm_public_ip.was_pubip.id
    private_ip_address_allocation = "Dynamic"
  }

  depends_on = [azurerm_public_ip.was_pubip]
}
resource "azurerm_linux_virtual_machine" "was" { #이미지를 만들기위한 was 작업시작!!
  name                            = "${var.name}_was"
  location                        = var.location
  resource_group_name             = var.resource_group
  network_interface_ids           = [azurerm_network_interface.was_nwif.id]
  size                            = var.was-vm-size
  admin_username                  = "rara"
  admin_password                  = "tlswldnd123@"
  disable_password_authentication = false
  computer_name                   = var.wasvm-os-comname
  /*
    admin_ssh_key {
      username = "was"
      public_key = azurerm_ssh_public_key.star_ssh.public_key
    }
    */

  source_image_reference {
    publisher = var.wasvm-img-pub
    offer     = var.wasvm-img-off
    sku       = var.wasvm-img-sku
    version   = var.wasvm-img-ver
  }

  os_disk {
    name                 = "star-was-osdisk"
    caching              = var.wasvm-disk-cach
    storage_account_type = var.wasvm-disk-type
  }

  depends_on = [azurerm_network_interface.was_nwif]
}
