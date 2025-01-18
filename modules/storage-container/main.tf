resource "azurerm_storage_container" "container" {
  name                  = var.storage_container.name
  storage_account_name  = var.storage_account_name
  container_access_type = var.storage_container.container_access_type
}