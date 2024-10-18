terraform {
  required_version = ">=1.3.7"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.43.0"
    }
  }
  cloud {
    organization = "my_org_jgdev522"
    workspaces {
      name = "remote_state"
    }
  }
}


provider "azurerm" {
  features {}
  subscription_id = "0cfe2870-d256-4119-b0a3-16293ac11bdc"
}

resource "azurerm_resource_group" "rg" {
  name     = "1-d925ba90-playground-sandbox"
  location = "East US"

}

resource "azurerm_storage_account" "storage" {
  name                     = "stgrcaiml001"
  location                 = azurerm_resource_group.rg.location
  resource_group_name      = azurerm_resource_group.rg.name
  account_tier             = "Standard"
  account_replication_type = "RAGRS"
}