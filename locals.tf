locals {
  tags = {
    "Owner"       = var.owner,
    "Environment" = terraform.workspace
    "Project"     = var.project_name,
    "Management"  = "terraform",
  }

  tenant_id = data.azurerm_client_config.current.tenant_id
}
