resource "azurerm_mssql_server" "mssql" {
  name                         = var.sql_server_name
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = azurerm_resource_group.rg.location
  version                      = "12.0"
  administrator_login          = var.db_user
  administrator_login_password = var.db_password
}

resource "azurerm_mssql_database" "db" {
  name           = "Solumina"
  server_id      = azurerm_mssql_server.mssql.id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  license_type   = "LicenseIncluded"
  max_size_gb    = 50
  read_scale     = false
  sku_name       = "S0"
  zone_redundant = false
}

# resource "azurerm_mssql_virtual_network_rule" "vnetrule" {
#   name      = "sql-vnet-rule"
#   server_id = azurerm_mssql_server.mssql.id
#   subnet_id = azurerm_subnet.subnet-aks.id
# }