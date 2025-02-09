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
   default = "EAST US"
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

variable "storage_account_number" {
  type = set(string)  
  default = [ "storage1", "storage2", "storage3" ]
}

resource "azurerm_storage_account" "storage_account" {
  for_each = var.storage_account_number
  name = each.value
  #name                     = "storageacc${var.storage_account_number[count.index]}"
  #count = length(var.storage_account_number)
  resource_group_name      = azurerm_resource_group.resource_group.name
  location                 = azurerm_resource_group.resource_group.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    #environment = "var.environment${count.index}"
    environment = var.environment
  }
}

output "geo_location_created" {
  value = var.geo_location
}
