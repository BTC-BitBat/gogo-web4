
resource "azurerm_virtual_machine_extension" "vmex_was" {
  name = "${var.name}_vmex_was"
  virtual_machine_id = azurerm_linux_virtual_machine.was.id
  publisher = "Microsoft.Azure.Extensions"
  type = "CustomScript"
  type_handler_version = "2.0"
  
  settings = <<SETTINGS
    {
        "script": "${filebase64("tomcat.sh")}"
    }
    SETTINGS

depends_on = [
  azurerm_linux_virtual_machine.was
] 
}