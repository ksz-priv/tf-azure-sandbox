module "naming" {
  source              = "../naming"
  environment         = var.environment
  project             = var.project
  characteristic_name = var.characteristic_name
}

resource "azurerm_log_analytics_workspace" "log_analytics_workspace" {
  name                = module.naming.log_analytics_workspace
  location            = var.location
  resource_group_name = var.rg_name
  sku                 = var.log_analytics_workspace.sku
  retention_in_days   = var.log_analytics_workspace.retention_in_days
  daily_quota_gb      = var.log_analytics_workspace.daily_quota_gb
  tags                = local.tags
}