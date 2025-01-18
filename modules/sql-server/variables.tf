variable "project" {
  type        = string
  description = "Name of the project"
}

variable "environment" {
  type        = string
  description = "Name of the environment"
}

variable "characteristic_name" {
  type        = string
  default     = ""
  description = "Resource characteristic name"
}

variable "rg_name" {
  type = string
}

variable "location" {
  type = string
}

variable "sql_server" {
  type = object({
    version                       = string
    administrator_login           = string
    administrator_password_seed   = string
    minimum_tls_version           = string
    ad_admin_upn                  = string
    azuread_authentication_only   = bool
    public_network_access_enabled = bool
    create_private_components = bool
  })
}

variable "prv_endpoint_db" {
  type = object({
    name = string
    private_service_connection = object({
      is_manual_connection = bool
      subresource_names    = string
    })
  })
  default = {
    name = ""
    private_service_connection = {
      is_manual_connection = false
      subresource_names    = ""
    }
  }
  description = "Private endpoint for SQL server"
}

variable "subnet_id" {
  type     = string
  nullable = true
  default  = null
}

variable "vnet_id" {
  type     = string
  nullable = true
  default  = null
}

variable "db_admin_pwd_name" {
  type = string
}

variable "db_admin_login_name" {
  type = string
}

variable "key_vault_id" {
  type = string
}

variable "sql_firewall_rules" {
  type = list(object({
    name = string
    ip   = string
  }))
  default = [{
    name = ""
    ip   = ""
  }]
  description = "SQL Server firewall rules"
}

variable "tags" {
  type = map(string)
}
