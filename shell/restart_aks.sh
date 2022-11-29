#!/bin/sh

echo "Stopping AKS"
az aks stop -g $AKS_RG -n $AKS_NAME

sleep 300

echo "Starting AKS"
az aks start -g $AKS_RG -n $AKS_NAME