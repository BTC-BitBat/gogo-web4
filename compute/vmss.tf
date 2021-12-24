resource "azurerm_linux_virtual_machine_scale_set" "vmss" { 
  name                            = "${var.name}_vmss"
  resource_group_name             = var.resource_group
  location                        = var.location
  sku                             = "Standard_DS1_v2"
  instances                       = 2
  disable_password_authentication = false
  computer_name_prefix            = "vmss"
  admin_username                  = "rara"
  upgrade_mode                    = "Automatic"
  admin_password                  = "tlswldnd123@"
  zones                           = [1,2]
  boot_diagnostics {
    storage_account_uri = null
  }
  #overprovision = false
  #platform_fault_domain_count = 1


  /*admin_ssh_key {
            username = "was-vmss"
            public_key = azurerm_ssh_public_key.star_ssh.public_key
        }*/

  /*source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }*/

  source_image_id = azurerm_image.image.id
  overprovision = false

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }

  //health_probe_id = var.ilb_healthprobe


  #vmss-nif #ilb association vmss-backend
  network_interface {
    name                      = "was-nwif"
    primary                   = true
    network_security_group_id = var.nsg_img_id

    ip_configuration {
      name                                   = "was_ipcfg"
      primary                                = true
      subnet_id                              = var.wassubnet_id
      load_balancer_backend_address_pool_ids = [var.ilb_backend_address_id]


     
    }

    
  }
  depends_on = [
    azurerm_image.image
  ]
}
