
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

variable "sku_name" {
  type        = string
  description = "The SKU name of the Notification Hub Namespace."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which the Notification Hub Namespace should be created."
}

variable "location" {
  type        = string
  description = "The location of the resource group in which the Notification Hub Namespace should be created."
}

variable "namespace_type" {
  type        = string
  description = "The type of the Notification Hub Namespace."
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource."
}


