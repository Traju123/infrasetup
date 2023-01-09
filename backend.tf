provider "azurerm" {
  features {}
}
terraform {
    backend "azurerm" {
        resource_group_name  = "testresourse3112"
        storage_account_name = "backendsterraformfile"
        container_name       = "tfstate"
        key                  = "terraform.tfstate"
    }

}

resource "azurerm_resource_group" "state-demo-secure" {
  name     = "state-demo"
  location = "eastus"
}
