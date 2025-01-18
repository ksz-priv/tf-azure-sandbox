module "naming" {
  source              = "../naming"
  project             = var.project
  environment         = var.environment
  characteristic_name = var.characteristic_name
}


resource "azurerm_container_app_environment" "cae" {
  name                       = module.naming.container_app_env
  resource_group_name        = var.resource_group_name
  location                   = var.location
  tags                       = var.tags
  log_analytics_workspace_id = var.log_analytics_workspace_id

  lifecycle {
    ignore_changes = [
      workload_profile,
    ]
  }


  dynamic "workload_profile" {
    for_each = var.workload_profiles
    content {
      minimum_count         = workload_profile.value.minimum_count
      maximum_count         = workload_profile.value.maximum_count
      name                  = workload_profile.value.name
      workload_profile_type = workload_profile.value.workload_profile_type
    }
  }
}
