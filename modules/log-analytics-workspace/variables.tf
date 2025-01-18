variable "environment" {
  type = string
}

variable "project" {
  type = string
}

variable "characteristic_name" {
  type    = string
  default = ""
}

variable "rg_name" {
  type = string
}

variable "location" {
  type = string
}

variable "log_analytics_workspace" {
  type = object({
    sku               = string
    retention_in_days = number
    daily_quota_gb    = number
  })
}

variable "tags" {
  type = map(string)
}
