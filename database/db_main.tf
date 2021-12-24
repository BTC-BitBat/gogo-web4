# Mysql server 생성
resource "azurerm_mysql_server" "mysql" {
  name                              = "jw-db"
  resource_group_name               = var.resource_group
  location                          = var.resource_group_location
  version                           = var.db-ver
  administrator_login               = var.db-admin
  administrator_login_password      = var.db-admin-pw
  sku_name                          = var.db-sku-name
  storage_mb                        = var.ssl-mb
  auto_grow_enabled                 = false
  backup_retention_days             = 7
  geo_redundant_backup_enabled      = true
  infrastructure_encryption_enabled = false
  public_network_access_enabled     = true
  ssl_enforcement_enabled           = var.ssl-enforce

}

# Mysql Database 생성
resource "azurerm_mysql_database" "db" {
  name                = "petclinic"
  resource_group_name = var.resource_group
  server_name         = var.db_server_name
  charset             = var.db-charset
  collation           = var.db-colla

  depends_on = [
    azurerm_mysql_server.mysql
  ]
}

# SQL Server Firewall rule 생성
resource "azurerm_mysql_firewall_rule" "db_firewall" {
  name                = "${var.name}_db_fire"
  resource_group_name = var.resource_group
  server_name         = var.db_server_name
  start_ip_address    = var.db-fw-startip
  end_ip_address      = var.db-fw-endip

  timeouts {
    delete = "15m"
  }

  depends_on = [
    azurerm_mysql_database.db
  ]
}

##### Mysql Configuration #####
resource "azurerm_mysql_configuration" "db_conf" {
  resource_group_name = var.resource_group
  server_name         = var.db_server_name
  

  # mysql 서버 시간 맞추기
  name  = "time_zone"
  value = "+09:00"

  depends_on = [
    azurerm_mysql_database.db
  ]
}

