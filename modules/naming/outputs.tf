locals {
  default_name_elements = [
    lower(var.project),
    lower(var.characteristic_name),
    lower(var.environment)
  ]
  default_name_elements_alphanumeric = [
    replace(lower(var.project), "/[^a-z0-9]/", ""),
    replace(lower(var.characteristic_name), "/[^a-z0-9]/", ""),
    replace(lower(var.environment), "/[^a-z0-9]/", "")
  ]
}

output "action_group" {
  value = join("-", compact(concat(
    ["ag"],
    local.default_name_elements
  )))
}

// Naming restrictions: 1-12 alphanumerics and hyphens.
output "action_group_short_name" {
  value = lower(var.characteristic_name)
}

output "app_service_plan" {
  value = join("-", compact(concat(
    ["asp"],
    local.default_name_elements
  )))
}

output "app_service" {
  value = join("-", compact(concat(
    ["app"],
    local.default_name_elements
  )))
}

output "function_app" {
  value = join("-", compact(concat(
    ["func"],
    local.default_name_elements
  )))
}

output "app_insights" {
  value = join("-", compact(concat(
    ["appi"],
    local.default_name_elements
  )))
}

output "application_insights_web_test" {
  value = join("-", compact(concat(
    ["appitest"],
    local.default_name_elements
  )))
}

output "sql_server" {
  value = join("-", compact(concat(
    ["sql"],
    local.default_name_elements
  )))
}

output "sql_database" {
  value = join("-", compact(concat(
    ["sqldb"],
    local.default_name_elements
  )))
}

output "frontdoor" {
  value = join("-", compact(concat(
    ["afd"],
    local.default_name_elements
  )))
}

// Naming restrictions: 3-24 alphanumerics and hyphens. 
// More info: https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/resource-name-rules#microsoftkeyvault
output "key_vault" {
  value = join("-", compact(concat(
    ["kv"],
    local.default_name_elements
  )))
}

// Naming restrictions: 1-127 alphanumerics and hyphens. 
// More info: https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/resource-name-rules#microsoftkeyvault
output "key_vault_secret" {
  value = join("-", compact(concat(
    ["kv", "secret"],
    local.default_name_elements
  )))
}

output "log_analytics_workspace" {
  value = join("-", compact(concat(
    ["log"],
    local.default_name_elements
  )))
}

output "monitor_metric_alert" {
  value = join("-", compact(concat(
    ["mma"],
    local.default_name_elements
  )))
}

output "monitor_diagnostic_setting" {
  value = join("-", compact(concat(
    ["mds"],
    local.default_name_elements
  )))
}

output "resource_group" {
  value = join("-", compact(concat(
    ["rg"],
    local.default_name_elements
  )))
}

# Naming restrictions: 3-24 lowercase letters and numbers. 
# More info: https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/resource-name-rules#microsoftstorage
output "storage_account" {
  value = join("", compact(concat(
    ["st"],
    local.default_name_elements
  )))
}

output "user_assigned_identity" {
  value = join("-", compact(concat(
    ["id"],
    local.default_name_elements
  )))
}

output "redis" {
  value = join("-", compact(concat(
    ["redis"],
    local.default_name_elements
  )))
}

output "virtual_network" {
  value = join("-", compact(concat(
    ["vnet"],
    local.default_name_elements
  )))
}

output "subnet" {
  value = join("-", compact(concat(
    ["net"],
    local.default_name_elements
  )))
}

output "private_endpoint" {
  value = join("-", compact(concat(
    ["pep"],
    local.default_name_elements
  )))
}

output "private_endpoint_private_service_connection" {
  value = join("-", compact(concat(
    ["pepsc"],
    local.default_name_elements
  )))
}

output "private_dns_zone_virtual_network_link" {
  value = join("-", compact(concat(
    ["vnetlink"],
    local.default_name_elements
  )))
}

output "kubernetes_cluster" {
  value = join("-", compact(concat(
    ["aks"],
    local.default_name_elements
  )))
}

output "kubernetes_cluster_node_rg" {
  value = join("-", compact(concat(
    ["rg"],
    ["aks"],
    local.default_name_elements
  )))
}

output "public_ip" {
  value = join("-", compact(concat(
    ["pip"],
    local.default_name_elements
  )))
}

# Naming restrictions: 5-50 lowercase letters and numbers. 
# More info: https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/resource-name-rules#microsoftcontainerregistry
output "container_registry" {
  value = join("", compact(concat(
    ["cr"],
    local.default_name_elements_alphanumeric
  )))
}

output "cosmos_mongo_account" {
  value = join("-", compact(concat(
    ["cosmon"],
    local.default_name_elements
  )))
}

output "mysql_server" {
  value = join("-", compact(concat(
    ["mysql"],
    local.default_name_elements
  )))
}

output "psql_server" {
  value = join("-", compact(concat(
    ["psql"],
    local.default_name_elements
  )))
}

output "network_interface" {
  value = join("-", compact(concat(
    ["nic"],
    local.default_name_elements
  )))
}

output "network_security_group" {
  value = join("-", compact(concat(
    ["nsg"],
    local.default_name_elements
  )))
}

output "recovery_services_vault" {
  value = join("-", compact(concat(
    ["rsv"],
    local.default_name_elements
  )))
}

output "virtual_machine" {
  value = join("-", compact(concat(
    ["vm"],
    local.default_name_elements
  )))
}

output "os_disk" {
  value = join("-", compact(concat(
    ["osdisk"],
    local.default_name_elements
  )))
}

output "disk" {
  value = join("-", compact(concat(
    ["disk"],
    local.default_name_elements
  )))
}

output "container_app_env" {
  value = join("-", compact(concat(
    ["cae"],
    local.default_name_elements
  )))
}

output "container_app" {
  value = join("-", compact(concat(
    ["ca"],
    local.default_name_elements
  )))
}

output "cdn_profile" {
  value = join("-", compact(concat(
    ["cdnp"],
    local.default_name_elements
  )))
}

output "cdn_endpoint" {
  value = join("-", compact(concat(
    ["cdne"],
    local.default_name_elements
  )))
}

output "notification_hub_namespace" {
  value = join("-", compact(concat(
    ["ntfns"],
    local.default_name_elements
  )))
}

output "notification_hub" {
  value = join("-", compact(concat(
    ["ntf"],
    local.default_name_elements
  )))
}
