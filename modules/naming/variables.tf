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
  description = "It should be something to let us know, that this Resource is dedicated to an application, like 'user-profile' if it relates to user profile, or empty if it does not relate to a specific app."
  default     = ""
}
