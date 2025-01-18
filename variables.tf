variable "project_name" {
  description = "The name of the project"
  type        = string
}

variable "owner" {
  type        = string
  description = "Owner of the project"
}

variable "location" {
  type        = string
  description = "Location of the resources"
}


variable "trusted_ip_addresses" {
  type = list(object({
    name = string
    ip   = string
  }))
  description = "List of trusted IP addresses"
}

variable "subscription_id" {
  type        = string
  description = "Subscription ID"
}
