output "workspace_resource_id" {
  value       = azurerm_log_analytics_workspace.log_analytics_workspace.id
  description = "ID of log analytics workspace resource"
}

output "workspace_key" {
  value       = azurerm_log_analytics_workspace.log_analytics_workspace.primary_shared_key
  description = "Primary shared key of log analytics workspace"
}

output "workspace_id" {
  value       = azurerm_log_analytics_workspace.log_analytics_workspace.workspace_id
  description = "Workspace ID of log analytics workspace"
}

output "workspace_name" {
  value       = azurerm_log_analytics_workspace.log_analytics_workspace.name
  description = "Name of the log analytics workspace"
}