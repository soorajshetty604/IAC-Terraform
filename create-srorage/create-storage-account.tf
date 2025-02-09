#add required provider

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.46.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# create storage account in azure using terraform
resource "azurerm_storage_account" "storage_account" {
  name                     = "testaccountby007"
  resource_group_name      = azurerm_resource_group.resource_group.name
  location                 = azurerm_resource_group.resource_group.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

#add resource group
resource "azurerm_resource_group" "resource_group" {
  name     = "testingresourcegroup"
  location = "East US"
}