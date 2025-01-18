data "azuread_client_config" "current" {}


resource "azuread_application" "application" {
  display_name                   = var.app_display_name
  owners                         = [data.azuread_client_config.current.object_id]
  sign_in_audience               = var.sign_in_audience
  logo_image                     = filebase64("${path.module}/logo.png")
  fallback_public_client_enabled = var.public_client_enabled

  public_client {
    redirect_uris = var.public_client_enabled ? var.public_client_redirect_uris : null

  }

  api {
    requested_access_token_version = var.requested_access_token_version
    mapped_claims_enabled          = false
  }

  lifecycle {
    ignore_changes = [
      api[0].oauth2_permission_scope,
      api[0].known_client_applications,
      required_resource_access,
      identifier_uris,
      single_page_application,
    ]
  }

  feature_tags {
    enterprise            = true
    gallery               = true
    hide                  = false
    custom_single_sign_on = false
  }

  dynamic "app_role" {
    for_each = var.app_roles
    content {
      allowed_member_types = app_role.value.allowed_member_types
      description          = app_role.value.description
      display_name         = app_role.value.display_name
      id                   = app_role.value.id
      value                = app_role.value.value
    }
  }



  web {
    redirect_uris = length(var.web_redirect_uris) > 0 ? var.web_redirect_uris : null
    implicit_grant {
      access_token_issuance_enabled = var.access_token_issuance_enabled
      id_token_issuance_enabled     = var.id_token_issuance_enabled
    }
  }

}

resource "azuread_application_redirect_uris" "spa" {
  count          = length(var.single_page_application_redirect_uris) > 0 ? 1 : 0
  type           = "SPA"
  application_id = azuread_application.application.id
  redirect_uris  = var.single_page_application_redirect_uris
}

resource "azuread_application_pre_authorized" "application_pre_authorized" {
  for_each             = { for app in var.pre_authorized_applications : app.client_id => app }
  application_id       = azuread_application.application.id
  authorized_client_id = each.value.client_id
  permission_ids = each.value.general_access ? [
    for scope in azuread_application.application.api[0].oauth2_permission_scope :
    scope.id if scope.value == "api"
  ] : each.value.permission_ids
}

resource "azuread_application_identifier_uri" "application_identifier_uri" {
  for_each       = { for uri in var.identifier_uris : uri => uri }
  application_id = azuread_application.application.id
  identifier_uri = each.value
}

resource "azuread_application_identifier_uri" "application_identifier_uri_api" {
  count          = var.expose_web_api ? 1 : 0
  application_id = azuread_application.application.id
  identifier_uri = "api://${azuread_application.application.client_id}"
}


resource "azuread_application_password" "application_password" {
  for_each          = { for app_client_secret in var.application_client_secrets : app_client_secret.display_name => app_client_secret }
  application_id    = azuread_application.application.id
  display_name      = each.value.display_name
  end_date_relative = each.value.end_date_relative
  rotate_when_changed = {
    rotation = time_rotating.application_password_time_rotating[each.key].id
  }
}

resource "azuread_application_permission_scope" "application_permission_scope" {
  for_each = {
    for app_permissions in var.application_permission_scopes : app_permissions.value => app_permissions
    if app_permissions != null
  }
  application_id             = azuread_application.application.id
  scope_id                   = random_uuid.example_administer.result
  value                      = each.value.value
  admin_consent_description  = each.value.admin_consent_description
  admin_consent_display_name = each.value.admin_consent_display_name
  user_consent_description   = each.value.user_consent_description
  user_consent_display_name  = each.value.user_consent_display_name
  type                       = each.value.type

}

resource "azuread_application_api_access" "application_api_access" {
  for_each = {
    for api_access in var.application_api_accesses : api_access.api_client_id => api_access
    if api_access != null
  }
  application_id = azuread_application.application.id
  api_client_id  = each.value.api_client_id
  role_ids       = each.value.role_ids
  scope_ids      = each.value.scope_ids
}

resource "random_uuid" "example_administer" {}

resource "time_rotating" "application_password_time_rotating" {
  for_each        = { for app_client_secret in var.application_client_secrets : app_client_secret.display_name => app_client_secret.rotation_months }
  rotation_months = each.value
}


