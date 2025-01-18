variable "storage_account_name" {
  type = string
}

variable "storage_container" {
  type = object({
    name                  = string
    container_access_type = string
  })
}