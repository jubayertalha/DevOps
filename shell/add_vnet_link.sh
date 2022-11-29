#!/bin/sh

AKS_RG=aks-rg
AKS_NAME=aks-poc

Location=$(az group list \
  --query "[?name=='aks-rg'].location" \
  --output tsv)

DNS_RG="MC_"$AKS_RG"_"$AKS_NAME"_"$Location

DNS_Name=$(az network private-dns zone list \
  -g $DNS_RG \
  --query "[0].name" \
  --output tsv)

echo $DNS_Name

VNetID=$(az network vnet list \
  --resource-group vnet-rg \
  --query "[?name=='other-vnet'].id" \
  --output tsv)

echo $VNetID

az network private-dns link vnet create \
  -g $DNS_RG \
  -n DNS-Sever-Link \
  -z $DNS_Name \
  -v $VNetID \
  -e False