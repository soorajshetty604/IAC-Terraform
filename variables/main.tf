terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.46.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "StorageAccount-ResourceGroup"  # Can be passed via `-backend-config=`"resource_group_name=<resource group name>"` in the `init` command.
    storage_account_name = "acc21261"                      # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "tfstate"                       # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "staging.terraform.tfstate"        # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

variable "geo_location" {
   description = "geographical location where resources to be created"
   type = string
   default = "WEST US"
}

variable "environment" {
  description = "type of environment"
  type = string
  default = "staging"  
}

resource "azurerm_resource_group" "resource_group" {
  name     = "testingresourcegroup"
  location =  var.geo_location
}

resource "azurerm_storage_account" "storage_account" {
  name                     = "storageby0071"
  resource_group_name      = azurerm_resource_group.resource_group.name
  location                 = azurerm_resource_group.resource_group.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = var.environment
  }
}

output "geo_location_created" {
  value = var.geo_location
}