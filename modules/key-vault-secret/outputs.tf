output "secret_value" {
  value       = azurerm_key_vault_secret.secret.value
  description = "Key Vault secret value"
}

output "secret_id" {
  value       = azurerm_key_vault_secret.secret.versionless_id
  description = "Key Vault secret ID"
}
