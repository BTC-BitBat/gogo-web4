variable "name" {}
variable "resource_group" {}
variable "location" {}
variable "web_priority" {}
variable "web_direction" {}
variable "web_access" {}
variable "web_protocol" {}
variable "web_sport" {}
variable "web_dport" {}
variable "web_sprefix" {}
variable "web_dprefix" {}

variable "websubnet_id" {}
variable "wassubnet_id" {}
variable "dbsubnet_id" {}
#variable "imgsubnet_id" {}
variable "bastion_id" {}
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
/*
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
*/
variable "bas_allocation" {
  #type = string
  #default = "Static"  
}

variable "bas_sku" {
  #type = string
  #default = "Standard"  
}
