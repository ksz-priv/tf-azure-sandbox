output "name" {
  value = azurerm_notification_hub_namespace.notification_hub_namespace.name
}

output "servicebus_endpoint" {
  value = azurerm_notification_hub_namespace.notification_hub_namespace.servicebus_endpoint
}
