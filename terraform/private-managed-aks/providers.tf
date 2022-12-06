provider "azurerm" {
  features {}
    use_msi   = true
    subscription_id = "3bfcc35e-ce3c-472d-8381-8d3418583e59"
    client_id       = "a5a9c507-98e9-4f75-ab86-ece3629950b8"
    tenant_id       = "58afed70-7d18-47ed-a97a-77f8b0a4b089"
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.78.0"
    }
  }
}
