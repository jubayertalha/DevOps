#!/bin/sh

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

DNS_Name="privatelink.$Location.azmk8s.io"

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