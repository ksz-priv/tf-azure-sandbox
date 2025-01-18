variable "sql_database" {
  type = object({
    name        = string
    collation   = string
    sku_name    = string
    max_size_gb = string
    short_term_retention_policy = object({
      retention_days           = number
      backup_interval_in_hours = number
    })
  })
}

variable "sql_server_id" {
  type = string
}

variable "tags" {
  type = map(string)
}