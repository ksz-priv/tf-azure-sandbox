terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.16.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "3.1.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-kszaz-sandbox-state"
    storage_account_name = "kszazsandboxstate"
    container_name       = "kszazsandbox-state"
    key                  = "azsandbox-"
  }
}

provider "azurerm" {
  skip_provider_registration = true

  features {}

  subscription_id = var.subscription_id
}

provider "azuread" {}
