resource "azurerm_mssql_database" "sql_db" {
  name        = var.sql_database.name
  server_id   = var.sql_server_id
  collation   = var.sql_database.collation
  max_size_gb = var.sql_database.max_size_gb
  sku_name    = var.sql_database.sku_name
  tags        = local.tags

  short_term_retention_policy {
    retention_days           = var.sql_database.short_term_retention_policy.retention_days
    backup_interval_in_hours = var.sql_database.short_term_retention_policy.backup_interval_in_hours
  }
}
