terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
  backend "azurerm" {
    /* resource_group_name  = "rg-tf_V3"
    storage_account_name = "sttfv3jdca"
    container_name       = "tfstatefile"
    key                  = "terraform.tfstate"
    subscription_id      = "141950e1-13e1-447a-8ef4-38a502de49ba"
  */
  }
}

provider "azurerm" {
  alias           = "online"
  subscription_id = "99efcdcb-3c41-4806-adcc-971369124351"
  features {}
}

provider "azurerm" {
  alias           = "Corp"
  subscription_id = "91bfe00e-50fd-424c-91d8-9e3c7e69f9f7"
  features {}
}

provider "azurerm" {
  alias           = "Management"
  subscription_id = "a5969b60-7b9f-49d4-ab7f-519e1ba49037"
  features {}
}

resource "azurerm_resource_group" "resource_group" {
  provider = azurerm.online
  name     = "rg-tf_V3"
  location = "eastus2"
}

# Create a storage account
resource "azurerm_storage_account" "storage_account" {
  provider                 = azurerm.online
  name                     = "sttfv3jdca"
  resource_group_name      = azurerm_resource_group.resource_group.name
  location                 = azurerm_resource_group.resource_group.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"

  static_website {
    index_document = "index.html"
  }
}

resource "azurerm_storage_blob" "blob" {
  provider               = azurerm.online
  name                   = "index.html"
  storage_account_name   = azurerm_storage_account.storage_account.name
  storage_container_name = "$web"
  type                   = "Block"
  content_type           = "text/html"
  source_content         = "<h1>Hello, Terraform!</h1>"
}
