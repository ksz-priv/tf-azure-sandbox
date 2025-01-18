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

variable "location" {
  type        = string
  description = "The location of the resource group in which the Container Registry should be created."
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource."

}


variable "log_analytics_workspace_id" {
  type        = string
  description = "The ID of the Log Analytics Workspace to link to the Container App Environment."
  default     = null
}

variable "workload_profiles" {
  type = list(object({
    minimum_count         = number
    maximum_count         = number
    name                  = string
    workload_profile_type = string
  }))
  description = "The workload profiles for the Container App Environment."
  validation {
    error_message = "Minimum count must be less than maximum count for all workload profiles"
    condition     = alltrue([for wp in var.workload_profiles : wp.minimum_count <= wp.maximum_count])
  }
  default = []
}

