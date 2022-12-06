output "aks_id" {
  value = azurerm_kubernetes_cluster.aks.id
}

output "aks_fqdn" {
  value = azurerm_kubernetes_cluster.aks.fqdn
}

output "aks_node_rg" {
  value = azurerm_kubernetes_cluster.aks.node_resource_group
}

output "dns_zone_id" {
  value = data.azurerm_dns_zone.dns.id
}

output "subnet_id" {
  value = "${data.azurerm_subnet.aks.id}"
}

output "uai_id" {
  value = data.azurerm_user_assigned_identity.uai.id
}