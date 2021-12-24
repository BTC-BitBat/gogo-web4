variable "name" {}
variable "resource_group" {}
variable "virtual_network_name" {}
variable "location"{}
variable "vnetcidr" {
  type    = string
  #default = "172.16.0.0/16"
}
variable "websubnetcidr" {
  type    = string
  #default = "172.16.1.0/24"
}
variable "wassubnetcidr" {
  type    = string
  #default = "172.16.2.0/24"
}
variable "dbsubnetcidr" {
  type    = string
  #default = "172.16.3.0/24"
}
variable "bassubnetcidr" {
  type    = string
  #default = "172.16.4.0/24"
}

/*variable "imgsubnetcidr" {
  type    = string
  #default = "172.16.5.0/24"
}*/
