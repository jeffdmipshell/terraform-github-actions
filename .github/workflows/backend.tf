# backend.tf

terraform {
  backend "azurerm" {
resource_group_name  = "rg-tf_V3"
    storage_account_name = "sttfv3jdca"
    container_name       = "tfstatefile"
    key                  = "terraform.tfstate"
    subscription_id      = "141950e1-13e1-447a-8ef4-38a502de49ba"
  }
}