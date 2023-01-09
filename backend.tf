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
resource "azurerm_kubernetes_cluster" "aks" {
  name                = "demo1"
  location            = "eastus"
  resource_group_name = "testresourse3112"
  dns_prefix          = "test"


  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = var.default_node_pool_vm_size
  }

  identity {
    type = "Standard_D2_v2"

  }

}

output "client_certificate" {
  value = azurerm_kubernetes_cluster.aks.kube_config.0.client_certificate
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.aks.kube_config_raw
}
