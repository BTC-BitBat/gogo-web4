# ELB 설정
# public ip
# Front ip 설정
# backend , association
# probe 80, health
# inbound rule 80
# outbound rule
# Web nif

# ILB
resource "azurerm_lb" "ilb" {
  name                = "${var.name}_ilb"
  location            = var.location
  resource_group_name = var.resource_group
  sku                 = var.ilb_sku
  
  frontend_ip_configuration {
    name                          = var.ilb_front_ip
    subnet_id                     = var.wassubnet_id
    private_ip_address_allocation = var.ilb_pip_allo
  }
}

# ilb back
resource "azurerm_lb_backend_address_pool" "ilb_back" {
  #resource_group_name = var.resource_group
  loadbalancer_id = azurerm_lb.ilb.id
  name            = "${var.name}_ilb_back"
  depends_on = [
    azurerm_lb.ilb
  ]
}

# ilb probe
resource "azurerm_lb_probe" "ilb_probe" {
  resource_group_name = var.resource_group
  loadbalancer_id     = azurerm_lb.ilb.id
  name                = "${var.name}_ilb_probe"
  port                = var.ilb_probe_port

  depends_on = [
    azurerm_lb_backend_address_pool.ilb_back
  ]
}

# ilb inbound
resource "azurerm_lb_rule" "ilb_in_rule" { 
  resource_group_name            = var.resource_group
  name                           = "${var.name}ilb_in_rule" 
  loadbalancer_id                = azurerm_lb.ilb.id
  probe_id                       = azurerm_lb_probe.ilb_probe.id
  disable_outbound_snat          = true
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.ilb_back.id]
  frontend_port                  = var.ilb_rule_front_port
  backend_port                   = var.ilb_rule_back_port
  frontend_ip_configuration_name = var.ilb_front_ip
  protocol                       = var.ilb_rule_proto
}

