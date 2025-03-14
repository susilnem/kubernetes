provider "azurerm" {
  features {}
}

terraform {
  required_providers {
    # Azure manager
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.22.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
  }
  # Terraform required version
  required_version = ">= 1.1.0"
}
