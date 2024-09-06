# backend.tf

terraform {
  backend "azurerm" {
resource_group_name  = "rg-tf_V3"
    storage_account_name = "sttfv3jdca"
    container_name       = "tfstatefile"
    key                  = "terraform.tfstate"
    subscription_id      = "99efcdcb-3c41-4806-adcc-971369124351"
  }
}