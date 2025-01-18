resource "azurerm_key_vault_secret" "secret" {
  name         = var.kv_secret.name
  value        = var.kv_secret.value
  key_vault_id = var.key_vault_id
  content_type = "secret"

  lifecycle {
    ignore_changes = [
      content_type
    ]
  }
}