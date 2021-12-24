# ELB Public ip
resource "azurerm_public_ip" "elb_pub" {
  name                = "${var.name}_elb_pub"
  location            = var.location
  resource_group_name = var.resource_group
  allocation_method   = var.elb_pub_allo
  sku                 = var.elb_pub_sku
  availability_zone   = 1

}

resource "azurerm_lb" "elb" {
  name                = "${var.name}_elb"
  location            = var.location
  resource_group_name = var.resource_group
  sku                 = var.elb_sku

  frontend_ip_configuration {
    name                 = var.elb_ipcfg
    public_ip_address_id = azurerm_public_ip.elb_pub.id
  }

  depends_on = [
    azurerm_public_ip.elb_pub
  ]
}

# ELB backend
resource "azurerm_lb_backend_address_pool" "elb_back" {
  resource_group_name = var.resource_group
  loadbalancer_id = azurerm_lb.elb.id
  name            = "${var.name}_elb_back"
  depends_on = [
    azurerm_lb.elb
  ]
}

#ELB probe
resource "azurerm_lb_probe" "elb_probe" {
  resource_group_name = var.resource_group
  loadbalancer_id = azurerm_lb.elb.id
  name = "${var.name}_elb_probe"
  protocol = var.elb_protocol
  //request_path = var.elb_path
  port = var.elb_port
  
  depends_on = [
    azurerm_lb_backend_address_pool.elb_back
  ]
}
# ELB inbound rule http
resource "azurerm_lb_rule" "elb_rule" {
  name                           = "${var.name}_elb_inbound_rule"
  resource_group_name            = var.resource_group
  loadbalancer_id                = azurerm_lb.elb.id
  probe_id                       = azurerm_lb_probe.elb_probe.id
  disable_outbound_snat          = true
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.elb_back.id]
  frontend_port                  = var.e_front_port
  backend_port                   = var.e_back_port
  frontend_ip_configuration_name = var.elb_ipcfg
  protocol                       = var.elb_rule_proto

  depends_on = [
    azurerm_lb_probe.elb_probe
  ]
}
# ELB backend association
resource "azurerm_network_interface_backend_address_pool_association" "elb_back_nif_ass1" {
  network_interface_id = var.web_vm_z1_1nif_id
  ip_configuration_name = var.web_vm_z1_1pub
  backend_address_pool_id = azurerm_lb_backend_address_pool.elb_back.id

  depends_on = [
    azurerm_lb_backend_address_pool.elb_back
  ]
}
resource "azurerm_network_interface_backend_address_pool_association" "elb_back_nif_ass2" {
  network_interface_id = var.web_vm_z1_2nif_id
  ip_configuration_name = var.web_vm_z1_2pub
  backend_address_pool_id = azurerm_lb_backend_address_pool.elb_back.id

  depends_on = [
    azurerm_lb_backend_address_pool.elb_back
  ]

}
resource "azurerm_network_interface_backend_address_pool_association" "elb_back_nif_ass3" {
  network_interface_id = var.web_vm_z2_1nif_id
  ip_configuration_name = var.web_vm_z2_1pub
  backend_address_pool_id = azurerm_lb_backend_address_pool.elb_back.id

  depends_on = [
    azurerm_lb_backend_address_pool.elb_back
  ]

}
resource "azurerm_network_interface_backend_address_pool_association" "elb_back_nif_ass4" {
  network_interface_id = var.web_vm_z2_2nif_id
  ip_configuration_name = var.web_vm_z2_2pub
  backend_address_pool_id = azurerm_lb_backend_address_pool.elb_back.id

  depends_on = [
    azurerm_lb_backend_address_pool.elb_back
  ]

}



# ELB outbound rule
resource "azurerm_lb_outbound_rule" "elb_out" {
  resource_group_name      = var.resource_group
  loadbalancer_id          = azurerm_lb.elb.id
  name                     = "${var.name}_lb_out"
  protocol                 = var.elb_out_proto
  backend_address_pool_id  = azurerm_lb_backend_address_pool.elb_back.id
  allocated_outbound_ports = var.allo_out_ports

  frontend_ip_configuration {
    name = var.elb_ipcfg
  }

  depends_on = [
    azurerm_lb_rule.elb_rule
  ]
}

