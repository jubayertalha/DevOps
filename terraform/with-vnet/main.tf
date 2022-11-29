resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_network_security_group" "nsg" {
  name                = var.nsg_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = [var.vnet_cidr]
}

resource "azurerm_subnet" "subnet-aks" {
  name                 = var.aks_subnet_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.aks_subnet_cidr]
}

resource "azurerm_subnet" "subnet-gw" {
  name                 = var.gw_subnet_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.gw_subnet_cidr]
}

resource "azurerm_subnet_network_security_group_association" "nsg-association" {
  subnet_id                 = azurerm_subnet.subnet-aks.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

resource "azurerm_public_ip" "public-ip" {
  name                = var.public_ip_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "Standard"
  allocation_method   = "Static"
  zones               = [ 1,2,3 ]
}

resource "azurerm_virtual_network_gateway" "vnet-gw" {
  name                = var.vnet_gw_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  type     = var.vnet_gw_type
  vpn_type = var.vnet_gw_vpn_type

  active_active = false
  enable_bgp    = false
  sku           = var.vnet_gw_sku
  generation    = var.vnet_gw_generation

  ip_configuration {
    public_ip_address_id          = azurerm_public_ip.public-ip.id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = azurerm_subnet.subnet-gw.id
  }

  vpn_client_configuration {
    address_space        = [var.vpn_cidr]
    vpn_auth_types       = ["Certificate"]
    vpn_client_protocols = ["IkeV2","OpenVPN"]

    root_certificate {
      name             = "MyAzureRoot"
      public_cert_data = var.vpn_root_cert
    }
  }
}