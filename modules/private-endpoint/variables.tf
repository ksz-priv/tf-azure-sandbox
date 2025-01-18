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

variable "subnet_id" {
  type = string
}

variable "private_endpoint_connection" {
  type = object({
    name              = string
    is_manual         = bool
    subresource_names = optional(list(string), [])
  })
}

variable "private_endpoint_connection_resource_id" {
  type = string
}

variable "private_dns_zone_ids" {
  type    = list(string)
  default = []
}

variable "tags" {
  type = map(string)
}
