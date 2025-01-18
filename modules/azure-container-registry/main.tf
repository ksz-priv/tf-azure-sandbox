module "naming" {
  source              = "../naming"
  project             = var.project
  environment         = var.environment
  characteristic_name = var.characteristic_name
}


resource "azurerm_container_registry" "acr" {
  name                = module.naming.container_registry
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.sku
  tags                = var.tags
  admin_enabled       = var.admin_enabled

}
