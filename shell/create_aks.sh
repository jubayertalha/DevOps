#!/bin/sh

az login --identity --username /subscriptions/863fda5d-6174-4448-8f7b-f8b0f9008431/resourcegroups/identity-rg/providers/Microsoft.ManagedIdentity/userAssignedIdentities/myACRId

AKS_RG=aks-rg
AKS_NAME=aks-poc

VNet_RG=vnet-rg
VNet_Name=test-vnet
VNet_Subnet_Name=aks-subnet

Identity_RG=identity-rg
Identity_Name=myACRId

VM_Size=Standard_D4s_v3
Nodepool_Name=agentpool
Nodepool_Count=2

DNS_ID=$(az network private-dns zone list \
  -g $AKS_RG \
  --query "[0].id" \
  --output tsv)

SubnetID=$(az network vnet subnet list \
  --resource-group $VNet_RG \
  --vnet-name $VNet_Name \
  --query "[?name=='$VNet_Subnet_Name'].id" \
  --output tsv)

Identity=$(az identity list \
  --resource-group $Identity_RG \
  --query "[?name=='$Identity_Name'].id" \
  --output tsv)

Location=$(az group list \
  --query "[?name=='$AKS_RG'].location" \
  --output tsv)


az aks create \
  -g $AKS_RG \
  -n $AKS_NAME \
  --kubernetes-version 1.28.0 \
  --location $Location \
  --enable-managed-identity \
  --assign-identity $Identity \
  --assign-kubelet-identity $Identity \
  --nodepool-name $Nodepool_Name \
  --node-count $Nodepool_Count \
  --node-vm-size $VM_Size \
  --vnet-subnet-id $SubnetID \
  --private-dns-zone $DNS_ID \
  --load-balancer-sku Standard \
  --network-plugin azure \
  --network-policy calico \
  --service-cidr 10.1.0.0/16 \
  --dns-name-prefix akspoc \
  --dns-service-ip 10.1.0.10 \
  --enable-cluster-autoscaler \
  --max-count 2 \
  --min-count 1 \
  --enable-private-cluster \
  --no-ssh-key