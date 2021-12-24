resource "azurerm_virtual_machine_scale_set_extension" "vmss_ex" {
  name                         = var.name
  virtual_machine_scale_set_id = azurerm_linux_virtual_machine_scale_set.vmss.id
  publisher = "Microsoft.Azure.Extensions"
  type                         = "CustomScript"
  type_handler_version         = "2.0"

    settings = <<SETTINGS
    {
        "script": "${filebase64("tomcat.sh")}"
    }
    SETTINGS
}  

