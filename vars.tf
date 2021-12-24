
variable "name" {
  #type    = string
  #default = "jw"
}
variable "location" {
  #type    = string
  #default = "koreacentral"
}
###########networking#####################
variable "vnetcidr" {
  #type    = string
  #default = "172.16.0.0/16"
}

variable "websubnetcidr" {
  #type    = string
  #default = "172.16.1.0/24"
}

variable "wassubnetcidr" {
  #type    = string
  #default = "172.16.2.0/24"
}

variable "dbsubnetcidr" {
  #type    = string
  #default = "172.16.3.0/24"
}

variable "bassubnetcidr" {
  #type    = string
  #default = "172.16.4.0/24"
}

variable "imgsubnetcidr" {
  #type    = string
  #default = "172.16.5.0/24"
}

#=========web_nsg_rule============================
variable "web_priority" {
  #type    = string
  #default = "101"
}

variable "web_direction" {
  #type    = string
  #default = "Inbound"
}
variable "web_access" {
  #type    = string
  #default = "Allow"
}

variable "web_protocol" {
  #type    = string
  #default = "Tcp"
}

variable "web_sport" {
  #type    = string
  #default = "*"
}

variable "web_dport" {
  #type    = list(string)
  #default = ["80" , "22"]
}

variable "web_sprefix" {
  #type    = string
  #default = "*"
}

variable "web_dprefix" {
  #type    = string
  #default = "*"
}

variable "web_ipcfg_allo" {
  #type = string
  #default = "Dynamic"  
}

variable "web_vm_z1_1pub" {
  #type = string
  #default = "web_vm_pub"
}
variable "web_vm_z1_2pub" {
  #type = string
  #default = "web_vm_pub"
}
variable "web_vm_z2_1pub" {
  #type = string
  #default = "web_vm_pub"
}
variable "web_vm_z2_2pub" {
  #type = string
  #default = "web_vm_pub"
}
#===========was_nsg_rule===========================

variable "was_priority" {
  #type    = string
  #default = "102"
}

variable "was_direction" {
  #type    = string
  #default = "Inbound"
}

variable "was_access" {
  #type    = string
  #default = "Allow"
}

variable "was_protocol" {
  #type    = string
  #default = "Tcp"
}

variable "was_sport" {
  #type    = string
  #default = "*"
}

variable "was_dport" {
  #type    = list(string)
  #default = ["8080" , "22"]
}

variable "was_sprefix" {
  #type    = string
  #default = "*"
}

variable "was_dprefix" {
  #type    = string
  #default = "*"
}
#===========db_nsg_rule=======================

variable "db_priority" {
  #type    = string
  #default = "100"
}

variable "db_direction" {
  #type    = string
  #default = "Inbound"
}

variable "db_access" {
  #type    = string
  #default = "Allow"
}

variable "db_protocol" {
  #type    = string
  #default = "Tcp"
}

variable "db_sport" {
  #type    = string
  #default = "*"
}

variable "db_dport" {
  #type    = string
  #default = "3306"
}

variable "db_sprefix" {
  #type    = string
  #default = "*"
}

variable "db_dprefix" {
  #type    = string
  #default = "*"
}
#####################IMG_nsg_rule#######################
variable "img_priority" {
  #type    = string
  #default = "103"
}

variable "img_direction" {
  #type    = string
  #default = "Inbound"
}

variable "img_access" {
  #type    = string
  #default = "Allow"
}

variable "img_protocol" {
  #type    = string
  #default = "Tcp"
}

variable "img_sport" {
  #type    = string
  #default = "*"
}

variable "img_dport" {
  #type    = list(string)
  #default = ["80" , "8080" , "22"]
}

variable "img_sprefix" {
  #type    = string
  #default = "*"
}

variable "img_dprefix" {
  #type    = string
  #default = "*"
}

variable "bas_allocation" {
  #type = string
  #default = "Static"  
}

variable "bas_sku" {
  #type = string
  #default = "Standard"  
}
#=================================ELB===================================
variable "elb_pub_allo" {
  #type = string
  #default = "Static"
}

variable "elb_pub_sku" {
  #type = string
  #default = "Standard"
}

variable "elb_sku" {
  #type = string
  #default = "Standard"
}

variable "elb_protocol" {
  #type = string
  #default = "Http"
}

variable "elb_path" {
  #type = string
  #default = "/health.html"
}

variable "elb_port" {
  #type = number
  #default = 80
}

variable "e_front_port" {
  #type = number
  #default = 80
}

variable "e_back_port"{
  #type = number
  #default = 80
}

variable "elb_ipcfg" {
  #type = string
  #default = "lb_front_pub"
  
}

variable "elb_rule_proto" {
  #type = string
  #default = "Tcp"
}

variable "elb_out_proto" {
  #type = string
  #default = "All"
}

variable "allo_out_ports" {
  #type = number
  #default = 1024  
}

variable "elb_nat_rule_proto" {
  #type = string
  #default = "Tcp"  
}

variable "elb_nat_front_port" {
  #type = number
  #default = 22  
}

variable "elb_nat_back_port" {
  #type = number
  #default = 22  
}
#==================================ILB================================
variable "ilb_sku" {
  #type = string
  #default = "Standard"
}

variable "ilb_front_ip" {
  #type = string
  #default = "ilb_front_ip"
}

variable "ilb_pip_allo" {
  #type = string
  #default = "Dynamic"
}

variable "ilb_probe_port" {
  #type = number
  #default = 8080
}

variable "ilb_rule_front_port" {
  #type = number
  #default = 8080
}

variable "ilb_rule_back_port" {
  #type = number
  #default = 8080
}

variable "ilb_rule_proto" {
  #type = string
  #default = "Tcp"
}
#=======================web==================
/*
variable "web_vm_z1_1nif" {
  
}
variable "web_vm_z1_2nif" {
  
}
variable "web_vm_z2_1nif" {
  
}
variable "web_vm_z2_2nif" {
  
}
*/
variable "web-vm-size" {
  #type = string
  #default = "Standard_DS1_v2"
}

variable "webvm-comname" {
  #type = string
  #default = "junp"
}

variable "webvm-username" {
  #type = string
  #default = "rara"
}

variable "webvm_passwd" {

}

variable "webvm-sshkey-user" {
  #type = string
  #default = "rara"
}

variable "webvm-disk-cach" {
  #type = string
  #default = "ReadWrite"
}

variable "webvm-disk-type" {
  #type = strin#g
  #default = "StandardSSD_LRS"
}

variable "webvm-img-pub" {
  #type = string
  #default = "OpenLogic"
}

variable "webvm-img-off" {
  #type = string
  #default = "CentOS"
}

variable "webvm-img-sku" {
  #type = string
  #default = "7.5"
}

variable "webvm-img-ver" {
  #type = string
  #default = "latest"
}

/*
variable "del-os-termi" {
  default = true
}
variable "del-data-termi" {
  default = true
}
variable "vm-disk-cach" {
  #type = string
  #default = "ReadWrite"
}
variable "vm-disk-opt" {
  #type = string
  #default = "FromImage"
}
variable "vm-disk-#type" {
  #type = strin#g
  #default = "Standard_LRS"
}
variable "vm-os-comname" {
  #type = string
  #default = "junp"
}
variable "vm-os-username" {
  #type = string
  #default = "rara"
}
variable "vm-os-userpw" {
  #type = string
  #default = "tlswldnd123@"
}

variable "web-vmex-pub" {
  #type = string
  #default = "Microsoft.Azure.Extensions"
}

variable "web-vmex-#type" {
  #type = strin#g
  #default = "CustomScript"
}

variable "web-vmex-##typever" {
  #type = strin#g
  #default = "2.0"
}
*/
######################111 was vm

variable "was-pubip-allo" {
  #type = string
  #default = "Static"
}

variable "was-pubip-sku" {
  #type = string
  #default = "Standard"
}

variable "was-vm-size" {
  #type = string
  #default = "Standard_DS1_v2"
}

variable "wasvm-img-pub" {
  #type = string
  #default = "Canonical"
}

variable "wasvm-img-off" {
  #type = string
  #default = "UbuntuServer"
}

variable "wasvm-img-sku" {
  #type = string
  #default = "18.04-LTS"
}

variable "wasvm-img-ver" {
  #type = string
  #default = "latest"
}

variable "wasvm-disk-cach" {
  #type = string
  #default = "ReadWrite"
}

variable "wasvm-disk-opt" {
  #type = string
  #default = "FromImage"
}

variable "wasvm-disk-type" {
  #type = strin#g
  #default = "Standard_LRS"
}

variable "wasvm-os-comname" {
  #type = string
  #default = "was"
}

variable "wasvm-os-username" {
  #type = string
  #default = "rara"
}

variable "wasvm-os-userpw" {
  #type = string
  #default = "tlswldnd123@"
}

variable "wasvm-dis-pw-auth" {
  default = false
}
##########################112 db
variable "db-ver" {
  #type = string
  #default = "5.7"
}

variable "db-admin" {
  #type = string
  #default = "rara"
}

variable "db-admin-pw" {
  #type = string
  #default = "tlswldnd123@"
}

variable "db-sku-name" {
  #type = string
  #default = "GP_Gen5_2"
}

variable "ssl-enforce" {
  default = false
}

variable "ssl-mb" {
  #type = number
  #default = 5120
}

variable "db-charset" {
  #type = string
  #default = "utf8"
}

variable "db-colla" {
  #type = string
  #default = "utf8_unicode_ci"
}

variable "db-fw-startip" {
  #type = string
  #default = "0.0.0.0"
}

variable "db-fw-endip" {
  #type = string
  #default = "0.0.0.0"
}

variable "db-pri-ser-isconnec" {
  default = true
}


/*##########################112 was img
variable "was-img-nif-ipconfig" {
  #type = string
  #default = "Dynamic"
}

variable "was-img-vm-size" {
  #type = string
  #default = "Standard_DS1_v2"
}

variable "was-img-vm-username" {
  #type = string
  #default = "rara"
}

variable "was-img-vm-comname" {
  #type = string
  #default = "wasvm"
}

variable "was-img-vm-sshkey" {
  #type = string
  #default = "rara"
}

#variable "was-img-vm-username" {
  #type = string
  #default = "rara"
#}

variable "was-img-vm-disk-cach" {
  #type = string
  #default = "ReadWrite"
}
variable "was-img-vm-disk-acctype" {
  #type = strin#g
  #default = "StandardSSD_LRS"
}

variable "was-img-vm-refer-pub" {
  #type = string
  #default = "Canonical"
}
variable "was-img-vm-refer-off" {
  #type = string
  #default = "UbuntuServer"
}
variable "was-img-vm-refer-sku" {
  #type = string
  #default = "18.04-LTS"
}
variable "was-img-vm-refer-ver" {
  #type = string
  #default = "latest"
}

variable "was-img-vmex-pub" {
  #type = string
  #default = "Microsoft.Azure.Extensions"
}
variable "was-img-vmex-type" {
  #type = strin#g
  #default = "CustomScript"
}
variable "was-img-vmex-type-ver" {
  #type = strin#g
  #default = "2.0"
}

variable "was-shareimg-ostype" {
  #type = strin#g
  #default = "Linux"
}

variable "was-shareimg-spe" {
  default = true
}

*/