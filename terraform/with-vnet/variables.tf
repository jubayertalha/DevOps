variable "resource_group_name" {
  type        = string
  description = "RG name in Azure"
}
variable "location" {
  type        = string
  description = "Resources location in Azure"
}
variable "nsg_name" {
  type        = string
  description = "NSG name in Azure"
}
variable "vnet_name" {
  type        = string
  description = "VNet name in Azure"
}
variable "vnet_cidr" {
  type        = string
  description = "VNet CIDR in Azure"
}
variable "aks_subnet_name" {
  type        = string
  description = "AKS Subnet name in Azure"
}
variable "aks_subnet_cidr" {
  type        = string
  description = "AKS Subnet CIDR in Azure"
}
variable "gw_subnet_name" {
  type        = string
  description = "GW Subnet name in Azure"
}
variable "gw_subnet_cidr" {
  type        = string
  description = "Gateway Subnet CIDR in Azure"
}
variable "public_ip_name" {
  type        = string
  description = "Public IP name in Azure"
}
variable "vnet_gw_name" {
  type        = string
  description = "VNet Gateway name in Azure"
}
variable "vnet_gw_type" {
  type        = string
  description = "VNet Gateway type in Azure"
}
variable "vnet_gw_vpn_type" {
  type        = string
  description = "VNet Gateway VPN type in Azure"
}
variable "vnet_gw_sku" {
  type        = string
  description = "VNet Gateway SKU in Azure"
}
variable "vnet_gw_generation" {
  type        = string
  description = "VNet Gateway Generation in Azure"
}
variable "vpn_cidr" {
  type        = string
  description = "VPN CIDR in Azure"
}
variable "vpn_root_cert" {
  type        = string
  description = "VPN Root Cert in Azure"
}