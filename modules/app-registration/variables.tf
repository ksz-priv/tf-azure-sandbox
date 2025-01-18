variable "app_display_name" {
  type = string
}

variable "sign_in_audience" {
  type        = string
  description = "Determines who can use the application. Can be 'AzureADMyOrg', 'AzureADMultipleOrgs', 'AzureADandPersonalMicrosoftAccount', or 'PersonalMicrosoftAccount'"
  validation {
    condition     = contains(["AzureADMyOrg", "AzureADMultipleOrgs", "AzureADandPersonalMicrosoftAccount", "PersonalMicrosoftAccount"], var.sign_in_audience)
    error_message = "Invalid sign_in_audience"
  }
}

variable "public_client_enabled" {
  type = bool
}

variable "identifier_uris" {
  type    = list(string)
  default = []
}
variable "expose_web_api" {
  type        = bool
  default     = false
  description = "Determines if the application should expose a web API. api://<application_client_id>"
}


variable "single_page_application_redirect_uris" {
  type    = list(string)
  default = []
}

variable "application_client_secrets" {
  type = list(object({
    display_name      = string
    end_date_relative = string
    rotation_months   = number
  }))
  default = []
}

variable "app_roles" {
  type = list(object({
    allowed_member_types = list(string)
    description          = string
    display_name         = string
    id                   = string
    value                = string
  }))
  default = []
}

variable "application_permission_scopes" {
  type = list(object({
    admin_consent_description  = string
    admin_consent_display_name = string
    type                       = string
    user_consent_description   = string
    user_consent_display_name  = string
    value                      = string
  }))
  default = []
}

variable "web_redirect_uris" {
  type    = list(string)
  default = []
}
variable "access_token_issuance_enabled" {
  type    = bool
  default = false
}

variable "id_token_issuance_enabled" {
  type    = bool
  default = false
}
variable "public_client_redirect_uris" {
  type    = list(string)
  default = []
}

variable "app_role_assignment_required" {
  type    = bool
  default = false
}

variable "requested_access_token_version" {
  type    = number
  default = 2
}

variable "pre_authorized_applications" {
  type = list(object({
    client_id      = string
    permission_ids = optional(list(string), [])
    general_access = optional(bool, false)
  }))
  validation {
    condition     = length([for app in var.pre_authorized_applications : app.general_access ? 1 : length(app.permission_ids)]) == length(var.pre_authorized_applications)
    error_message = "Either general_access must be true or permission_ids must be provided"
  }
  default = []
}

variable "application_api_accesses" {
  type = list(object({
    api_client_id = string
    role_ids      = optional(list(string), [])
    scope_ids     = optional(list(string), [])
  }))
  default = []
}

