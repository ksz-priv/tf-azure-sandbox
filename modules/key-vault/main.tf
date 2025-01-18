module "naming" {
  source              = "../naming"
  project             = var.project
  environment         = var.environment
  characteristic_name = var.characteristic_name
}

resource "azurerm_key_vault" "kv" {
  name                          = module.naming.key_vault
  location                      = var.location
  resource_group_name           = var.rg_name
  tenant_id                     = data.azurerm_client_config.current.tenant_id
  enabled_for_disk_encryption   = var.key_vault.enabled_for_disk_encryption
  soft_delete_retention_days    = var.key_vault.soft_delete_retention_days
  purge_protection_enabled      = var.key_vault.purge_protection_enabled
  sku_name                      = var.key_vault.sku_name
  enable_rbac_authorization     = var.key_vault.enable_rbac_authorization
  public_network_access_enabled = var.key_vault.public_network_access_enabled
  tags                          = var.tags

  # network_acls {
  #   default_action = "Deny"
  #   bypass         = "AzureServices"
  #   ip_rules       = var.trusted_ip_addresses[*].ip
  # }

  lifecycle {
    ignore_changes = [
      access_policy,
      network_acls
    ]
  }
}

resource "azurerm_role_assignment" "user_kv_access" {
  for_each             = data.azuread_user.user
  scope                = azurerm_key_vault.kv.id
  role_definition_name = "Key Vault Secrets Officer"
  principal_id         = each.value.object_id
}

resource "azurerm_role_assignment" "identity_kv_access" {
  for_each             = { for idx, access in var.identities_access : idx => access }
  scope                = azurerm_key_vault.kv.id
  role_definition_name = each.value.role
  principal_id         = each.value.id
}

data "azuread_user" "user" {
  for_each            = { for name in var.users_access : name => name }
  user_principal_name = each.value
}

data "azurerm_client_config" "current" {}

module "private_endpoint" {
  count = var.key_vault.public_network_access_enabled ? 0 : 1

  source                                  = "../private-endpoint"
  project                                 = var.project
  environment                             = var.environment
  characteristic_name                     = "kv"
  rg_name                                 = var.rg_name
  location                                = var.location
  subnet_id                               = var.subnet_id
  private_endpoint_connection             = local.private_endpoint_connection
  private_endpoint_connection_resource_id = azurerm_key_vault.kv.id
  private_dns_zone_ids                    = [module.private_dns_zone[0].private_dns_zone_id]
  tags                                    = var.tags
}

module "private_dns_zone" {
  count = var.key_vault.public_network_access_enabled ? 0 : 1

  source        = "../private-dns-zone"
  dns_zone_name = "privatelink.vault.azure.net"
  rg_name       = var.rg_name
  vnet_id       = var.vnet_id
}
