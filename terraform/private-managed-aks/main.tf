data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

data "azurerm_subnet" "aks" {
  name                 = var.subnet_name
  virtual_network_name = var.vnet_name
  resource_group_name  = var.vnet_rg
}

data "azurerm_private_dns_zone" "dns" {
  name                = var.dns_zone_name
  resource_group_name = data.azurerm_resource_group.rg.name
}

data "azurerm_user_assigned_identity" "uai" {
  name                = var.uai_name
  resource_group_name = var.uai_rg
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                    = var.cluster_name
  kubernetes_version      = var.kubernetes_version
  location                = data.azurerm_resource_group.rg.location
  resource_group_name     = data.azurerm_resource_group.rg.name
  dns_prefix              = var.cluster_name
  private_cluster_enabled = true
  private_dns_zone_id     = data.azurerm_private_dns_zone.dns.id

  default_node_pool {
    name                = var.nodepoll_name
    vm_size             = var.node_vm_size
    node_count          = var.node_count
    max_count           = var.max_node_count
    min_count           = var.min_node_count
    type                = "VirtualMachineScaleSets"
    enable_auto_scaling = true
	  vnet_subnet_id      = data.azurerm_subnet.aks.id
    zones               = [ "1", "2", "3" ]
  }

  identity {
    type          = "UserAssigned"
    identity_ids  = [data.azurerm_user_assigned_identity.uai.id]
  }

  kubelet_identity {
    client_id                 = data.azurerm_user_assigned_identity.uai.client_id
    object_id                 = data.azurerm_user_assigned_identity.uai.principal_id
    user_assigned_identity_id = data.azurerm_user_assigned_identity.uai.id
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
