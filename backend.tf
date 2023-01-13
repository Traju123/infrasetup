provider "azurerm" {
  features {}
}
terraform {
    backend "azurerm" {
        resource_group_name  = "demojan13"
        storage_account_name = "demojan13"
        container_name       = "demo"
        key                  = "terraform.tfstate"
    }

}
resource "azurerm_kubernetes_cluster" "aks" {
  name                = "demojan13"
  location            = "eastus"
  resource_group_name = "demojan13"
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
