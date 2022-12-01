az login --identity --username /subscriptions/863fda5d-6174-4448-8f7b-f8b0f9008431/resourcegroups/identity-rg/providers/Microsoft.ManagedIdentity/userAssignedIdentities/myACRId

AKS_RG=aks-rg
AKS_NAME=aks-poc

Identity_RG=identity-rg
Identity_Name=myACRId

Identity=$(az identity list \
  --resource-group $Identity_RG \
  --query "[?name=='$Identity_Name'].id" \
  --output tsv)

az aks update \
    --resource-group $AKS_RG \
    --name $AKS_NAME \
    --assign-kubelet-identity $Identity