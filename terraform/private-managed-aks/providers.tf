provider "azurerm" {
  features {}
    use_msi         = true
    subscription_id = "863fda5d-6174-4448-8f7b-f8b0f9008431"
    client_id       = "e3859ee3-8420-4c4f-b7ab-491a4edc30bd"
    tenant_id       = "12025f5d-3ae2-41ea-8b1c-7b41d3f025c4"
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.34.0"
    }
  }
}
