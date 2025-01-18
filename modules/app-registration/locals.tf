# locals {
#   application_permissions = [for app_permissions in var.application_permissions : {
#     resource_app_display_name = app_permissions.self_app_permissions ? azuread_application.application.display_name : app_permissions.resource_app_display_name
#     resource_app_client_id    = app_permissions.self_app_permissions ? azuread_application.application.client_id : app_permissions.resource_app_client_id
#     # resource_app_service_principal_id = app_permissions.self_app_permissions ? azuread_service_principal.service_principal.id : app_permissions.resource_app_service_principal_id

#     permissions = [
#       for permission in app_permissions.permissions : {
#         id                        = permission.id
#         name                      = permission.name
#         type                      = permission.type
#         grant_tenant_wide_consent = permission.grant_tenant_wide_consent
#       }
#     ]
#   } if app_permissions != null]
# }
