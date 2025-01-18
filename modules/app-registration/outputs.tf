



output "application_client_secrets" {
  value = tolist(azuread_application.application.password)[*].value
}

output "application_display_name" {
  value = azuread_application.application.display_name
}

output "application_client_id" {
  value = azuread_application.application.client_id
}
