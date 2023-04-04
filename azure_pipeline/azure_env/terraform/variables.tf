variable "resource_group_name" {
  type        = string
  description = "RG name in Azure"
}
variable "location" {
  type        = string
  description = "Resources location in Azure"
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


# AKS

variable "cluster_name" {
  type        = string
  description = "AKS name in Azure"
}

variable "kubernetes_version" {
  type        = string
  description = "Kubernetes version"
}

variable "system_node_pool_name" {
  type        = string
  description = "Name of AKS node pool"
}

variable "system_node_count" {
  type        = number
  description = "Number of AKS worker nodes"
}

variable "system_min_node_count" {
  type        = number
  description = "Number of min AKS worker nodes"
}

variable "system_max_node_count" {
  type        = number
  description = "Number of max AKS worker nodes"
}

variable "system_node_vm_size" {
  type        = string
  description = "VM size for AKS worker nodes"
}

variable "service_cidr" {
  type        = string
  description = "Service CIDR"
}

variable "dns_service_ip" {
  type        = string
  description = "DNS service IP"
}

variable "docker_bridge_cidr" {
  type        = string
  description = "Docker bridge CIDR"
}


variable "bastion_name" {
  type        = string
  description = "VM name in Azure"
}
variable "bastion_size" {
  type        = string
  description = "VM size in Azure"
}
variable "bastion_username" {
  type        = string
  description = "VM username in Azure"
}
variable "bastion_password" {
  type        = string
  description = "VM password in Azure"
}


variable "acr_name" {
  type        = string
  description = "ACR name in Azure"
}
variable "sa_name" {
  type        = string
  description = "Storage Account name in Azure"
}

variable "sql_server_name" {
  type        = string
  description = "SQL Server name in Azure"
}

variable "db_user" {
  type        = string
  description = "DB user in Azure"
}
variable "db_password" {
  type        = string
  description = "DB password in Azure"
}

variable "dns_name" {
  type        = string
  description = "DNS name in Azure"
}