provider "azurerm" {
  features {}
}
terraform {
    backend "azurerm" {
        resource_group_name  = "demojan12"
        storage_account_name = "demojan21"
        container_name       = "demo"
        key                  = "terraform.tfstate"
    }

}
resource "azurerm_kubernetes_cluster" "aks" {
  name                = "finaltest"
  location            = "eastus"
  resource_group_name = "demojan12"
  dns_prefix          = "test"


  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"

  }

}

output "client_certificate" {
  value = azurerm_kubernetes_cluster.aks.kube_config.0.client_certificate
  sensitive = true
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive = true
}
