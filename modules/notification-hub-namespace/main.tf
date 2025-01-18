module "naming" {
  source              = "../naming"
  project             = var.project
  environment         = var.environment
  characteristic_name = var.characteristic_name
}


resource "azurerm_notification_hub_namespace" "notification_hub_namespace" {
  sku_name            = var.sku_name
  name                = module.naming.notification_hub_namespace
  resource_group_name = var.resource_group_name
  location            = var.location
  namespace_type      = var.namespace_type
  tags                = var.tags

  
}
