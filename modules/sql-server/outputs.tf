output "sql_server_id" {
  value       = azurerm_mssql_server.sql_server.id
  description = "ID of the SQL server"
}

output "sql_server_fqdn" {
  value       = azurerm_mssql_server.sql_server.fully_qualified_domain_name
  description = "FQDN of the SQL server"
}

output "sql_server_password" {
  value       = random_password.admin_pwd.result
  sensitive   = true
  description = "Password of admin user for SQL server"
}

output "sql_server_name" {
  value       = azurerm_mssql_server.sql_server.name
  description = "Name of the SQL server"
}

output "sql_server_user" {
  value = azurerm_mssql_server.sql_server.administrator_login
}