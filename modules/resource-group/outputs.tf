output "rg_name" {
  value       = azurerm_resource_group.main_rg.name
  description = "Resource Group name"
}

output "rg_id" {
  value       = azurerm_resource_group.main_rg.id
  description = "Resource Group ID"
}
