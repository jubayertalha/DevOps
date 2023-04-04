resource "azurerm_kubernetes_cluster" "aks" {
  name                    = var.cluster_name
  kubernetes_version      = var.kubernetes_version
  location                = azurerm_resource_group.rg.location
  resource_group_name     = azurerm_resource_group.rg.name
  dns_prefix              = var.cluster_name
  private_cluster_enabled = true

  default_node_pool {
    name                = var.system_node_pool_name
    node_count          = var.system_node_count
    enable_auto_scaling = true
    min_count           = var.system_min_node_count
    max_count           = var.system_max_node_count
    vm_size             = var.system_node_vm_size
    vnet_subnet_id      = azurerm_subnet.subnet-aks.id
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    load_balancer_sku   = "standard"
    network_plugin      = "azure" 
    network_policy      = "azure"
    service_cidr        = var.service_cidr
    dns_service_ip      = var.dns_service_ip
    docker_bridge_cidr  = var.docker_bridge_cidr
  }
}

resource "azurerm_role_assignment" "subnetaksrole" {
  principal_id                     = azurerm_kubernetes_cluster.aks.identity[0].principal_id
  role_definition_name             = "Network Contributor"
  scope                            = azurerm_subnet.subnet-aks.id
  skip_service_principal_aad_check = true
}