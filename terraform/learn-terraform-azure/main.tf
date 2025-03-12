terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.22.0"
    }
  }
  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "resource_group" {
  name     = "testSushilResourceGroup"
  location = "East US"

  tags = {
    Environment = "Terraform Learn"
  }
}

# create a virtual network in the resource group
resource "azurerm_virtual_network" "virtual_network" {
  name                = "testSushilVNet"
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = azurerm_resource_group.resource_group.location
  address_space       = ["10.0.0.0/16"]
}