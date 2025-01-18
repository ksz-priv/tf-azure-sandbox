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
variable "sku" {
  type        = string
  description = "The SKU which should be used for this Container Registry."

  validation {
    condition     = contains(["Basic", "Standard", "Premium"], var.sku)
    error_message = "Invalid SKU"
  }
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which the Container Registry should be created."

}

variable "location" {
  type        = string
  description = "The location of the resource group in which the Container Registry should be created."
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource."

}

variable "admin_enabled" {
  type        = bool
  description = "Should the admin user be enabled?"
}
