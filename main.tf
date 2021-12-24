terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.90.0"
    }
  }
}
provider "azurerm" {
  features {}
  subscription_id = "268a434d-f7e6-4966-bb27-d29e20a1b360"
}

module "resource" {
  source   = "./resourcegroup"
  name     = var.name
  location = var.location
}

module "networking" {
  source               = "./networking"
  name                 = var.name
  location             = var.location
  virtual_network_name = module.networking.network_name
  resource_group       = module.resource.resource_group_name
  vnetcidr             = var.vnetcidr
  websubnetcidr        = var.websubnetcidr
  wassubnetcidr        = var.wassubnetcidr
  #imgsubnetcidr        = var.imgsubnetcidr
  dbsubnetcidr  = var.dbsubnetcidr
  bassubnetcidr = var.bassubnetcidr
  depends_on = [
    module.resource
  ]
}
module "securitygroup" {
  source         = "./securitygroup"
  name           = var.name
  location       = var.location
  resource_group = module.resource.resource_group_name
  wassubnet_id   = module.networking.wassubnet_id
  websubnet_id   = module.networking.websubnet_id
  dbsubnet_id    = module.networking.dbsubnet_id
  #imgsubnet_id   = module.networking.imgsubnet_id
  bastion_id    = module.networking.bastion_id
  web_priority  = var.web_priority
  web_direction = var.web_direction
  web_access    = var.web_access
  web_protocol  = var.web_protocol
  web_sport     = var.web_sport
  web_dport     = var.web_dport
  web_sprefix   = var.web_sprefix
  web_dprefix   = var.web_dprefix
  was_priority  = var.was_priority  #우선순위
  was_direction = var.was_direction #방향(in,out)
  was_access    = var.was_access    #작업(허용,거부)
  was_protocol  = var.was_protocol  #프로토콜
  was_sport     = var.was_sport     #원본포트범위d
  was_dport     = var.was_dport     #대상포트범위 (실제포트번호)
  was_sprefix   = var.was_sprefix
  was_dprefix   = var.was_dprefix
  /*
  db_priority    = var.db_priority
  db_direction   = var.db_direction
  db_access      = var.db_access
  db_protocol    = var.db_protocol
  db_sport       = var.db_sport
  db_dport       = var.db_dport
  db_sprefix     = var.db_sprefix
  db_dprefix     = var.db_dprefix
  img_priority   = var.img_priority
  img_direction  = var.img_direction
  img_access     = var.img_access
  img_protocol   = var.img_protocol
  img_sport      = var.img_sport
  img_dport      = var.img_dport
  img_sprefix    = var.img_sprefix
  img_dprefix    = var.img_dprefix
  */
  bas_allocation = var.bas_allocation
  bas_sku        = var.bas_sku
  depends_on = [
    module.networking
  ]
}

module "compute" {
  source                 = "./compute"
  name                   = var.name
  location               = var.location
  resource_group         = module.resource.resource_group_name
  wassubnet_id           = module.networking.wassubnet_id
  websubnet_id           = module.networking.websubnet_id
  ilb_healthprobe        = module.loadbalance.ilb_healthprobe
  nsg_was_id             = module.securitygroup.nsg_was_id
  ilb_backend_address_id = module.loadbalance.ilb_backend_address_id
  web_vm_z1_1pub         = var.web_vm_z1_1pub
  web_vm_z1_2pub         = var.web_vm_z1_2pub
  web_vm_z2_1pub         = var.web_vm_z2_1pub
  web_vm_z2_2pub         = var.web_vm_z2_2pub
  web_ipcfg_allo         = var.web_ipcfg_allo
  web-vm-size            = var.web-vm-size
  webvm-username         = var.webvm-username
  webvm-comname          = var.webvm-comname
  webvm_passwd           = var.webvm_passwd
  webvm-disk-cach        = var.webvm-disk-cach
  webvm-disk-type        = var.webvm-disk-type
  webvm-img-pub          = var.webvm-img-pub
  webvm-img-off          = var.webvm-img-off
  webvm-img-sku          = var.webvm-img-sku
  webvm-img-ver          = var.webvm-img-ver
  /* was-pubip-allo         = var.was-pubip-allo
  was-pubip-sku          = var.was-pubip-sku
  was-vm-size            = var.was-vm-size
  wasvm-disk-cach        = var.wasvm-disk-cach
  wasvm-disk-opt         = var.wasvm-disk-opt
  wasvm-disk-type        = var.wasvm-disk-type
  wasvm-img-pub          = var.wasvm-img-pub
  wasvm-img-off          = var.wasvm-img-off
  wasvm-img-sku          = var.wasvm-img-sku
  wasvm-img-ver          = var.wasvm-img-ver
  wasvm-os-comname       = var.wasvm-os-comname
  wasvm-os-username      = var.wasvm-os-username
  wasvm-os-userpw        = var.wasvm-os-userpw
  wasvm-dis-pw-auth      = var.wasvm-dis-pw-auth
  */
}


module "loadbalance" {
  source              = "./loadbalance"
  name                = var.name
  location            = var.location
  resource_group      = module.resource.resource_group_name
  wassubnet_id        = module.networking.wassubnet_id
  web_vm_z1_1nif_id   = module.compute.web_vm_z1_1nif_id
  web_vm_z1_2nif_id   = module.compute.web_vm_z1_2nif_id
  web_vm_z2_1nif_id   = module.compute.web_vm_z2_1nif_id
  web_vm_z2_2nif_id   = module.compute.web_vm_z2_2nif_id
  elb_pub_allo        = var.elb_pub_allo
  elb_pub_sku         = var.elb_pub_sku
  elb_ipcfg           = var.elb_ipcfg
  elb_protocol        = var.elb_protocol
  elb_path            = var.elb_path
  elb_port            = var.elb_port
  elb_sku             = var.elb_sku
  e_front_port        = var.e_front_port
  e_back_port         = var.e_back_port
  elb_rule_proto      = var.elb_rule_proto
  elb_out_proto       = var.elb_out_proto
  allo_out_ports      = var.allo_out_ports
  elb_nat_rule_proto  = var.elb_nat_rule_proto
  elb_nat_front_port  = var.elb_nat_front_port
  elb_nat_back_port   = var.elb_nat_back_port
  ilb_sku             = var.ilb_sku
  ilb_front_ip        = var.ilb_front_ip
  ilb_pip_allo        = var.ilb_pip_allo
  ilb_probe_port      = var.ilb_probe_port
  ilb_rule_front_port = var.ilb_rule_front_port
  ilb_rule_back_port  = var.ilb_rule_back_port
  ilb_rule_proto      = var.ilb_rule_proto
  web_vm_z1_1pub      = var.web_vm_z1_1pub
  web_vm_z1_2pub      = var.web_vm_z1_2pub
  web_vm_z2_1pub      = var.web_vm_z2_1pub
  web_vm_z2_2pub      = var.web_vm_z2_2pub



}


module "database" {
  source                  = "./database"
  name                    = var.name
  vnet_id                 = module.networking.vnet_id
  resource_group          = module.resource.resource_group_name
  resource_group_location = module.resource.resource_group_location
  #dbsubnet_name = module.networking.dbsubnet_name
  #pri_dns_name = module.database.pri_dns_name
  #pri_dns_id = module.database.pri_dns_id
  db_server_name      = module.database.db_server_name
  dbserver_id         = module.database.dbserver_id
  dbsubnet_id         = module.networking.dbsubnet_id
  db-ver              = var.db-ver
  db-admin            = var.db-admin
  db-admin-pw         = var.db-admin-pw
  db-sku-name         = var.db-sku-name
  ssl-enforce         = var.ssl-enforce
  ssl-mb              = var.ssl-mb
  db-charset          = var.db-charset
  db-colla            = var.db-colla
  db-fw-startip       = var.db-fw-startip
  db-fw-endip         = var.db-fw-endip
  db-pri-ser-isconnec = var.db-pri-ser-isconnec

}



output "pubip" {
  value = module.loadbalance.pub_ip
}
//output "pri_ip" {
//  value = module.networking.wassubnet_ip
//}
