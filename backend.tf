provider "azurerm" {
  features {}
}
terraform {
    backend "azurerm" {
        resource_group_name  = "exampleGroup"
        storage_account_name = "backendstorageaks"
        container_name       = "tfstate"
        key                  = "terraform.tfstate"
        use_azuread_auth     = true
        subscription_id      = "00000000-0000-0000-0000-000000000000"
        tenant_id            = "00000000-0000-0000-0000-000000000000"
    }

}

resource "azurerm_resource_group" "state-demo-secure" {
  name     = "state-demo"
  location = "eastus"
}
