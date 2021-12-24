variable "name" {
  #type    = string
  #default = "jw"
}

variable "websubnet_id" {}

variable "wassubnet_id" {}

variable "location" {
  #type    = string
  #default = "koreacentral"
}
variable "resource_group" {}
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
variable "webvm_passwd"{}
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
  #default = false
}
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
}*/
variable "ilb_healthprobe" {
  
}

variable "nsg_was_id" {
  
}
variable "ilb_backend_address_id" {
  
}