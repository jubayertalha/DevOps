resource "azurerm_storage_account" "sa" {
  name                     = var.sa_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  network_rules {
    default_action             = "Deny"
    virtual_network_subnet_ids = [azurerm_subnet.subnet-aks.id]
  }
}

# resource "azurerm_storage_share" "fs" {
#   name                 = "examplefileshare"
#   storage_account_name = azurerm_storage_account.sa.name

#   quota = 50

#   enabled_protocol = "SMB"
# }