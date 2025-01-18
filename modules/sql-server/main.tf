module "naming" {
  source              = "../naming"
  project             = var.project
  environment         = var.environment
  characteristic_name = var.characteristic_name
}

resource "azurerm_mssql_server" "sql_server" {
  name                          = module.naming.sql_server
  resource_group_name           = var.rg_name
  location                      = var.location
  version                       = var.sql_server.version
  administrator_login           = var.sql_server.administrator_login
  administrator_login_password  = random_password.admin_pwd.result
  minimum_tls_version           = var.sql_server.minimum_tls_version
  public_network_access_enabled = var.sql_server.public_network_access_enabled
  tags                          = var.tags

  dynamic "azuread_administrator" {
    for_each = var.sql_server.ad_admin_upn != "" ? [1] : []
    content {
      azuread_authentication_only = var.sql_server.azuread_authentication_only
      login_username              = "Azure AD Admin"
      object_id                   = data.azuread_user.ad_admin[0].object_id
    }
  }
}

resource "random_password" "admin_pwd" {
  length           = 14
  min_upper        = 2
  min_lower        = 2
  min_numeric      = 2
  min_special      = 2
  override_special = "!@#%&*()-_+[]<>:?"

  keepers = {
    value = var.sql_server.administrator_password_seed
  }
}

resource "azurerm_key_vault_secret" "db_admin_pwd" {
  name         = var.db_admin_pwd_name
  value        = random_password.admin_pwd.result
  key_vault_id = var.key_vault_id
  content_type = "password"
}

resource "azurerm_key_vault_secret" "db_admin_login" {
  name         = var.db_admin_login_name
  value        = azurerm_mssql_server.sql_server.administrator_login
  key_vault_id = var.key_vault_id
}

resource "azurerm_management_lock" "server_lock" {
  name       = "sql-server-delete-lock"
  scope      = azurerm_mssql_server.sql_server.id
  lock_level = "CanNotDelete"
  notes      = "Locked because it stores important application data"
}

data "azuread_user" "ad_admin" {
  count               = var.sql_server.ad_admin_upn == "" ? 0 : 1
  user_principal_name = var.sql_server.ad_admin_upn
}

module "private_endpoint" {
  count = var.sql_server.create_private_components ? 1 : 0

  source                                  = "../private-endpoint"
  project                                 = var.project
  environment                             = var.environment
  characteristic_name                     = "sql"
  rg_name                                 = var.rg_name
  location                                = var.location
  subnet_id                               = var.subnet_id
  private_endpoint_connection             = local.private_endpoint_connection
  private_endpoint_connection_resource_id = azurerm_mssql_server.sql_server.id
  private_dns_zone_ids                    = [module.private_dns_zone[0].private_dns_zone_id]
  tags                                    = var.tags
}

module "private_dns_zone" {
  count = var.sql_server.create_private_components ? 1 : 0

  source        = "../private-dns-zone"
  dns_zone_name = "privatelink.database.windows.net"
  rg_name       = var.rg_name
  vnet_id       = var.vnet_id
}

resource "azurerm_mssql_firewall_rule" "firewall_rule" {
  for_each = {for name in var.sql_firewall_rules : name.name => name}
  name             = each.value.name
  server_id        = azurerm_mssql_server.sql_server.id
  start_ip_address = each.value.ip
  end_ip_address   = each.value.ip
}