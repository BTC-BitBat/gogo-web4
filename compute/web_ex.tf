resource "azurerm_virtual_machine_extension" "vmex_web_z1_1" {
  name = "${var.name}_vmex_web"
  virtual_machine_id = azurerm_linux_virtual_machine.web_z1_1.id
  publisher = "Microsoft.Azure.Extensions"
  type = "CustomScript"
  type_handler_version = "2.0"
  
  settings = <<SETTINGS
    {
        "script": "${filebase64("proxy.sh")}"
    }
    SETTINGS
    
    depends_on = [
      azurerm_linux_virtual_machine.web_z1_1
    ]
}

resource "azurerm_virtual_machine_extension" "vmex_web_z1_2" {
  name = "${var.name}_vmex_web"
  virtual_machine_id = azurerm_linux_virtual_machine.web_z1_2.id
  publisher = "Microsoft.Azure.Extensions"
  type = "CustomScript"
  type_handler_version = "2.0"
  
  settings = <<SETTINGS
    {
        "script": "${filebase64("proxy.sh")}"
    }
    SETTINGS
    
    depends_on = [
      azurerm_linux_virtual_machine.web_z1_2
    ]
}

resource "azurerm_virtual_machine_extension" "vmex_web_z2_1" {
  name = "${var.name}_vmex_web"
  virtual_machine_id = azurerm_linux_virtual_machine.web_z2_1.id
  publisher = "Microsoft.Azure.Extensions"
  type = "CustomScript"
  type_handler_version = "2.0"
  
  settings = <<SETTINGS
    {
        "script": "${filebase64("proxy.sh")}"
    }
    SETTINGS
    
    depends_on = [
      azurerm_linux_virtual_machine.web_z2_1
    ]
}

resource "azurerm_virtual_machine_extension" "vmex_web_z2_2" {
  name = "${var.name}_vmex_web"
  virtual_machine_id = azurerm_linux_virtual_machine.web_z2_2.id
  publisher = "Microsoft.Azure.Extensions"
  type = "CustomScript"
  type_handler_version = "2.0"
  
  settings = <<SETTINGS
    {
        "script": "${filebase64("proxyimg.sh")}"
    }
    SETTINGS
    
    depends_on = [
      azurerm_virtual_machine_extension.vmex_was
    ]
}
