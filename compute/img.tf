resource "azurerm_image" "image" {
    name = "${var.name}-image"
    location = var.location
    resource_group_name = var.resource_group
    source_virtual_machine_id = azurerm_linux_virtual_machine.was.id

    depends_on = [
      azurerm_virtual_machine_extension.vmex_web_z2_2
    ]
}


