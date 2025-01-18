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

variable "location" {
  type = string
}

variable "rg_name" {
  type = string
}

variable "storage_account" {
  type = object({
    account_tier             = string
    account_replication_type = string
    min_tls_version          = string
  })
}

variable "blob_properties" {
  type = object({
    cors_rule = object({
      allowed_headers    = list(string)
      allowed_methods    = list(string)
      allowed_origins    = list(string)
      exposed_headers    = list(string)
      max_age_in_seconds = number
    })
  })
  default     = null
  description = "Configuration for the CORS rules of the Storage Account"
}

variable "is_static_website" {
  type        = bool
  description = "Determines whether the Storage Account should be configured as a static website"
}

variable "storage_account_static_website" {
  type = object({
    index_document     = string
    error_404_document = string
  })
  default = {
    index_document     = null
    error_404_document = null
  }
  description = "Configuration for the static website feature of the Storage Account"
}

variable "key_vault_id" {
  type        = string
  nullable    = true
  default     = null
  description = "ID of the Key Vault to store the Storage Account access key"
}

variable "sa_access_key_kv_secret_name" {
  type        = string
  nullable    = true
  default     = null
  description = "Name of the Key Vault secret to store the Storage Account access key"
}

variable "use_custom_domain" {
  type        = bool
  default     = false
  description = "Determines whether a custom domain should be assigned to the storage account"
}

variable "custom_domain" {
  type = object({
    domain_name                   = string
    use_indirect_cname_validation = bool
  })
  default     = null
  description = "If custom domain is used, specifies its name and whether to use indirect validation for it"
}

variable "tags" {
  type = map(string)
}
