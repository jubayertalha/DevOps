variable "resource_group_name" {
  type        = string
  description = "RG name in Azure"
}

variable "cluster_name" {
  type        = string
  description = "AKS name in Azure"
}

variable "kubernetes_version" {
  type        = string
  description = "Kubernetes version"
}

variable "system_node_count" {
  type        = number
  description = "Number of AKS worker nodes"
}

variable "system_node_vm_size" {
  type        = string
  description = "VM size for AKS worker nodes"
}

variable "vnet_name" {
  type        = string
  description = "VNet name in Azure"
}

variable "subnet_name" {
  type        = string
  description = "Subnet name in Azure"
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