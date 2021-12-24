
name = "azuregod"

location = "koreacentral"

vnetcidr = "172.16.0.0/16"

##============Subnet=========================
websubnetcidr = "172.16.1.0/24"

wassubnetcidr = "172.16.2.0/24"

dbsubnetcidr = "172.16.3.0/24"

bassubnetcidr = "172.16.4.0/24"

#imgsubnetcidr = "172.16.5.0/24"

#=========web_nsg_rule============================
web_priority = "101"

web_direction = "Inbound"

web_access = "Allow"

web_protocol = "Tcp"

web_sport = "*"

web_dport = "80"

web_sprefix = "*"

web_dprefix = "*"

web_ipcfg_allo = "Dynamic"  

web_vm_z1_1pub = "web_vm_z1_1pub"
web_vm_z1_2pub = "web_vm_z1_2pub"
web_vm_z2_1pub = "web_vm_z2_1pub"
web_vm_z2_2pub = "web_vm_z2_2pub"

#===========was_nsg_rule===========================
was_priority = "102"

was_direction = "Inbound"

was_access = "Allow"

was_protocol = "Tcp"

was_sport = "*"

was_dport = "8080"

was_sprefix = "*"

was_dprefix = "*"
#===========db_nsg_rule=======================
/*
db_priority = "100"

db_direction = "Inbound"

db_access = "Allow"

db_protocol = "Tcp"

db_sport = "*"

db_dport = "3306"

db_sprefix = "*"

db_dprefix = "*"
*/
#####################IMG_nsg_rule#######################
/*
img_priority = "103"

img_direction = "Inbound"

img_access = "Allow"

img_protocol = "Tcp"

img_sport = "*"

img_dport = ["80" , "8080"]

img_sprefix = "*"

img_dprefix = "*"
*/
####========================Bastion===================================
bas_allocation = "Static"  

bas_sku = "Standard"  
#=================================ELB===================================
elb_pub_allo = "Static"

elb_pub_sku = "Standard"

elb_sku = "Standard"

elb_protocol = "Tcp"

elb_path = "/health.html"

elb_port = 80

e_front_port = 80

e_back_port= 80

elb_ipcfg = "lb_front_pub"
 
elb_rule_proto = "Tcp"

elb_out_proto = "All"

allo_out_ports = 1024  

elb_nat_rule_proto = "Tcp"  

elb_nat_front_port = 22  

elb_nat_back_port = 22  
#==================================ILB================================
ilb_sku = "Standard"

ilb_front_ip = "ilb_front_ip"

ilb_pip_allo = "Dynamic"

ilb_probe_port = 8080

ilb_rule_front_port = 8080

ilb_rule_back_port = 8080

ilb_rule_proto = "Tcp"

web-vm-size = "Standard_DS1_v2"

webvm-comname = "junp"

webvm-username = "rara"

webvm_passwd = "tlswldnd123@"

webvm-sshkey-user = "rara"

webvm-disk-cach = "ReadWrite"

webvm-disk-type = "StandardSSD_LRS"

webvm-img-pub = "OpenLogic"

webvm-img-off = "CentOS"

webvm-img-sku = "7.5"

webvm-img-ver = "latest"

/*"del-os-termi" = true
del-data-termi" = true
vm-disk-cach" = "ReadWrite"

"vm-disk-opt" = "FromImage"

"vm-disk-type" = "Standard_LRS"

"vm-os-comname" = "junp"

"vm-os-username" = "rara"

"vm-os-userpw" = "tlswldnd123@"
*/

web-vmex-pub = "Microsoft.Azure.Extensions"

web-vmex-type = "CustomScript"

web-vmex-typever = "2.0"

######################111 was vm

was-pubip-allo = "Static"

was-pubip-sku = "Standard"

was-vm-size = "Standard_DS1_v2"

wasvm-img-pub = "Canonical"

wasvm-img-off = "UbuntuServer"

wasvm-img-sku = "18.04-LTS"

wasvm-img-ver = "latest"

wasvm-disk-cach = "ReadWrite"

wasvm-disk-opt = "FromImage"

wasvm-disk-type = "Standard_LRS"

wasvm-os-comname = "was"

wasvm-os-username = "rara"

wasvm-os-userpw = "tlswldnd123@"

wasvm-dis-pw-auth = false

#########################112 db

db-ver = "5.7"

db-admin = "rara"

db-admin-pw = "tlswldnd123@"

db-sku-name = "GP_Gen5_2"

ssl-enforce = false

ssl-mb = 5120

db-charset = "utf8"

db-colla = "utf8_unicode_ci"

db-fw-startip = "0.0.0.0"

db-fw-endip = "0.0.0.0"

db-pri-ser-isconnec = false

/*##########################112 was img
"was-img-nif-ipconfig" = "Dynamic"


"was-img-vm-size" = "Standard_DS1_v2"


"was-img-vm-username" = "rara"


"was-img-vm-comname" = "wasvm"


"was-img-vm-sshkey" = "rara"


"was-img-vm-username" = "rara"


"was-img-vm-disk-cach" = "ReadWrite"

"was-img-vm-disk-acctype" = "StandardSSD_LRS"


"was-img-vm-refer-pub" = "Canonical"

"was-img-vm-refer-off" = "UbuntuServer"

"was-img-vm-refer-sku" = "18.04-LTS"

"was-img-vm-refer-ver" = "latest"


"was-img-vmex-pub" = "Microsoft.Azure.Extensions"

"was-img-vmex-type" = "CustomScript"

"was-img-vmex-typever" = "2.0"


"was-shareimg-ostype" = "Linux"


"was-shareimg-spe" = true


"was-shareimg-ostype" = "Linux"

*/