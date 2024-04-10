provider "azurerm" {
  features {}
}

variable "location" {
  description = "The location/region where the storage account is created"
  default     = "West Europe"
}

variable "storage_account_name" {
  description = "The name of the storage account"
}

resource "azurerm_resource_group" "example" {
  name     = "${var.storage_account_name}_rg"
  location = var.location
}

resource "azurerm_storage_account" "example" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}