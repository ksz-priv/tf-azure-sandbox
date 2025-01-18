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
  description = "The name of the resource group in which the Container Registry should be created."

}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource."

}


variable "container_app_environment_id" {
  type        = string
  description = "The ID of the Container App Environment to link to the Container Registry."
}

variable "revision_mode" {
  type        = string
  description = "The revision mode of the Container App."
  validation {
    condition     = contains(["Single", "Multiple"], var.revision_mode)
    error_message = "Invalid revision mode for Container App"
  }
}

variable "ingress" {

  type = object({
    allow_insecure_connections = bool
    external_enabled           = bool
    target_port                = number
    traffic_weights = list(object({
      percentage = number
      label      = string
    }))
  })


  description = "The ingress configuration for the Container App."
}

variable "identity_type" {
  type        = string
  description = "The type of identity to assign to the Container App."
  validation {
    condition     = contains(["SystemAssigned", "UserAssigned", ["SystemAssigned, UserAssigned"]], var.identity_type)
    error_message = "Invalid identity type for Container App"
  }
}

variable "secrets" {
  type = list(object({
    name                = string
    key_vault_secret_id = string
    identity            = string
  }))
  description = "The secrets to be added to the Container App."

}
