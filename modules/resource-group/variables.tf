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

variable "tags" {
  type        = map(string)
  description = "Resource TAGs"
}

