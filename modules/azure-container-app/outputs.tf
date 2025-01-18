output "identity_principal_id" {
  value = azurerm_container_app.ca.identity[0].principal_id
}
output "application_url" {
  value = "https://${azurerm_container_app.ca.ingress[0].fqdn}"
}
