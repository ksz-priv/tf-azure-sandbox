output "key_vault_id" {
  value       = azurerm_key_vault.kv.id
  description = "Key Vault ID"
}

output "key_vault_name" {
  value       = azurerm_key_vault.kv.name
  description = "Key Vault name"
}
