#!/bin/sh

AKS_RG=aks-rg
AKS_NAME=aks-poc

echo "Stopping AKS"
az aks stop -g $AKS_RG -n $AKS_NAME

sleep 300

echo "Starting AKS"
az aks start -g $AKS_RG -n $AKS_NAME