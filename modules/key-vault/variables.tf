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

variable "location" {
  type        = string
  description = "Location of the resources"
}

variable "rg_name" {
  type        = string
  description = "Resource Group name"
}

variable "tags" {
  type        = map(string)
  description = "Resource TAGs"
}

variable "key_vault" {
  type = object({
    enabled_for_disk_encryption   = bool
    soft_delete_retention_days    = number
    purge_protection_enabled      = bool
    sku_name                      = string
    enable_rbac_authorization     = bool
    public_network_access_enabled = bool
  })
  description = "Key Vault settings"
}

# variable "users_access" {
#   type = list(object({
#     upn                     = string
#     secret_permissions      = list(string)
#     certificate_permissions = list(string)
#   }))
#   default = [{
#     upn                     = ""
#     secret_permissions      = [""]
#     certificate_permissions = [""]
#   }]
#   description = "Key Vault users access list"
# }

variable "users_access" {
  type = list(string)
}

variable "identities_access" {
  type = list(object({
    id   = string
    role = string
  }))
  default = []
}

variable "trusted_ip_addresses" {
  type = list(object({
    name = string
    ip   = string
  }))
  description = "List of trusted IP addresses"
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
