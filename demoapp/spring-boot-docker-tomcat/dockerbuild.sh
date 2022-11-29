#!/bin/sh

AKS_RG=aks-rg
AKS_NAME=aks-poc

ACR_NAME=myacr221
ImageName=springboot
ImageVersion=v1.0
ImageTag=$ACR_NAME".azurecr.io/"$ImageName":"$ImageVersion

docker build -t $ImageTag .
echo "Built image: $ImageTag Done"

az login --identity --username /subscriptions/863fda5d-6174-4448-8f7b-f8b0f9008431/resourcegroups/identity-rg/providers/Microsoft.ManagedIdentity/userAssignedIdentities/myACRId
az aks get-credentials --resource-group $AKS_RG --name $AKS_NAME
az acr login --name $ACR_NAME

docker push $ImageTag

az acr repository list -n $ACR_NAME --output table

helm install $ImageName ./helm