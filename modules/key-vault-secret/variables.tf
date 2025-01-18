variable "kv_secret" {
  type = object({
    name  = string
    value = string
  })
  description = "Key Vault secret"
}

variable "key_vault_id" {
  type        = string
  description = "Key Vault ID"
}
