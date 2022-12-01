#!/bin/sh

az login --identity --username /subscriptions/863fda5d-6174-4448-8f7b-f8b0f9008431/resourcegroups/identity-rg/providers/Microsoft.ManagedIdentity/userAssignedIdentities/myACRId

Link_Name=DNS-Sever-Link

AKS_RG=aks-rg
AKS_NAME=aks-poc

VNet_RG=vnet-rg
VNet_Name=other-vnet

Location=$(az group list \
  --query "[?name=='$AKS_RG'].location" \
  --output tsv)

VNetID=$(az network vnet list \
  --resource-group $VNet_RG \
  --query "[?name=='$VNet_Name'].id" \
  --output tsv)

echo "VNetID: $VNetID"

DNS_Name="privatelink.$Location.azmk8s.io"

echo "Creating Private DNS Zone: $DNS_Name"

az network private-dns zone create \
  -g $AKS_RG \
  -n $DNS_Name

echo "DNS Zone created: $DNS_Name"

az network private-dns link vnet create \
  -g $AKS_RG \
  -n $Link_Name \
  -z $DNS_Name \
  -v $VNetID \
  -e False

echo "DNS Zone linked to VNet: $VNetID"