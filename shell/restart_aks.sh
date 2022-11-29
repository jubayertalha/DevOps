#!/bin/sh

AKS_RG=aks-rg
AKS_NAME=aks-poc

echo "Stopping AKS"
az aks stop -g $AKS_RG -n $AKS_NAME
echo "AKS stopped. Waiting 5 minutes for the cluster to start"

sleep 300

echo "Starting AKS"
az aks start -g $AKS_RG -n $AKS_NAME