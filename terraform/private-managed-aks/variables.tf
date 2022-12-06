variable "resource_group_name" {
  type        = string
  description = "RG name in Azure"
  default = "SHAW-AUTH-CICD-AKSPOC-RG"
}

variable "subnet_name" {
  type        = string
  description = "Subnet name in Azure"
}

variable "vnet_name" {
  type        = string
  description = "Vnet name in Azure"
}

variable "vnet_rg" {
  type        = string
  description = "Vnet RG name in Azure"
}

variable "cluster_name" {
  type        = string
  description = "AKS name in Azure"
}

variable "kubernetes_version" {
  type        = string
  description = "Kubernetes version"
}

variable "nodepoll_name" {
  type        = string
  description = "Nodepoll name in Azure"  
}

variable "node_vm_size" {
  type        = string
  description = "VM size in Azure"
}

variable "node_count" {
  type        = number
  description = "Node count in Azure"
}

variable "min_node_count" {
  type        = number
  description = "Node min count in Azure"
}

variable "max_node_count" {
  type        = number
  description = "Node max count in Azure"
}

variable "service_cidr" {
  type        = string
  description = "Service CIDR in Azure"
}

variable "dns_service_ip" {
  type        = string
  description = "DNS service IP in Azure"
}

variable "docker_bridge_cidr" {
  type        = string
  description = "Docker bridge CIDR in Azure"
}

variable "dns_zone_name" {
  type        = string
  description = "DNS zone name in Azure"
}

variable "uai_name" {
  type        = string
  description = "UAI name in Azure"
}

variable "uai_rg" {
  type        = string
  description = "UAI RG name in Azure"
}