output "static_website_url" {
  value       = azurerm_storage_account.storage_account.primary_web_endpoint
  description = "URL of static website hosted in storage account"
}

output "storage_account_name" {
  value       = azurerm_storage_account.storage_account.name
  description = "Name of storage account"
}

output "storage_account_access_key" {
  value       = azurerm_storage_account.storage_account.primary_access_key
  description = "Primary access key of storage account"
}

output "storage_account_connection_string" {
  value       = azurerm_storage_account.storage_account.primary_connection_string
  description = "Connection string of storage account"
}

output "storage_account_id" {
  value       = azurerm_storage_account.storage_account.id
  description = "ID of storage account"
}

output "storage_account_primary_blob_endpoint" {
  value       = azurerm_storage_account.storage_account.primary_blob_endpoint
  description = "The endpoint URL for blob storage in the primary location"
}