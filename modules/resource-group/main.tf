module "naming" {
  source              = "../naming"
  project             = var.project
  environment         = var.environment
  characteristic_name = var.characteristic_name
}

resource "azurerm_resource_group" "main_rg" {
  name     = module.naming.resource_group
  location = var.location
  tags     = var.tags
}
