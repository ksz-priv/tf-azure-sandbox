module "naming" {
  source              = "../naming"
  project             = var.project
  environment         = var.environment
  characteristic_name = var.characteristic_name
}


resource "azurerm_notification_hub" "notification_hub" {
  name                = module.naming.notification_hub
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags
  namespace_name      = var.namespace_name
}

