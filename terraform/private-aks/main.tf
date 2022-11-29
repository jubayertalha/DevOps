data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

data "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  virtual_network_name = var.vnet_name
  resource_group_name  = data.azurerm_resource_group.rg.name
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                    = var.cluster_name
  kubernetes_version      = var.kubernetes_version
  location                = data.azurerm_resource_group.rg.location
  resource_group_name     = data.azurerm_resource_group.rg.name
  dns_prefix              = var.cluster_name
  private_cluster_enabled = true

  default_node_pool {
    name                = "system"
    node_count          = var.system_node_count
    enable_auto_scaling = true
    min_count           = 1
    max_count           = 2
    vm_size             = var.system_node_vm_size
    vnet_subnet_id      = data.azurerm_subnet.subnet.id
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    load_balancer_sku   = "standard"
    network_plugin      = "azure" 
    network_policy      = "calico"
    service_cidr        = var.service_cidr
    dns_service_ip      = var.dns_service_ip
    docker_bridge_cidr  = var.docker_bridge_cidr
  }
}