module "naming" {
  source              = "../naming"
  project             = var.project
  environment         = var.environment
  characteristic_name = var.characteristic_name
}


resource "azurerm_container_app" "ca" {
  name                         = module.naming.container_app
  resource_group_name          = var.resource_group_name
  tags                         = var.tags
  container_app_environment_id = var.container_app_environment_id
  revision_mode                = var.revision_mode

  identity {
    type = var.identity_type
  }



  template {
    container {
      name   = "initial"
      image  = "mcr.microsoft.com/azuredocs/containerapps-helloworld:latest"
      cpu    = 0.25
      memory = "0.5Gi"

    }
    max_replicas = 1
    min_replicas = 1
  }
  ingress {
    allow_insecure_connections = var.ingress.allow_insecure_connections
    external_enabled           = var.ingress.external_enabled
    target_port                = var.ingress.target_port

    dynamic "traffic_weight" {
      for_each = var.ingress.traffic_weights
      content {
        percentage = traffic_weight.value.percentage
        label      = traffic_weight.value.label
        // set to true if that's the first from list
        latest_revision = traffic_weight.key == 0 ? true : false
      }
    }
  }



  dynamic "secret" {
    for_each = { for secret in var.secrets : secret.name => secret }
    content {
      name                = secret.value.name
      key_vault_secret_id = secret.value.key_vault_secret_id
      identity            = secret.value.identity
    }

  }

}


