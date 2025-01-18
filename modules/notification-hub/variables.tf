
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


variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which the Notification Hub Namespace should be created."
}

variable "location" {
  type        = string
  description = "The location of the resource group in which the Notification Hub Namespace should be created."
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource."
}


variable "namespace_name" {
  type        = string
  description = "The name of the Notification Hub Namespace in which the Notification Hub should be created."
}
