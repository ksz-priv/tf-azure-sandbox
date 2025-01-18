module "naming" {
  source              = "../naming"
  environment         = var.environment
  project             = replace(var.project, "-", "")
  characteristic_name = var.characteristic_name
}

resource "azurerm_storage_account" "storage_account" {
  name                     = module.naming.storage_account
  resource_group_name      = var.rg_name
  location                 = var.location
  account_tier             = var.storage_account.account_tier
  account_replication_type = var.storage_account.account_replication_type
  min_tls_version          = var.storage_account.min_tls_version
  tags                     = var.tags

  dynamic "custom_domain" {
    for_each = var.use_custom_domain ? [1] : []
    content {
      name          = var.custom_domain.domain_name
      use_subdomain = var.custom_domain.use_indirect_cname_validation
    }
  }

  dynamic "static_website" {
    for_each = var.is_static_website ? [1] : []
    content {
      index_document     = var.storage_account_static_website.index_document
      error_404_document = var.storage_account_static_website.error_404_document
    }
  }

  dynamic "blob_properties" {
    for_each = var.blob_properties == null ? [] : [1]
    content {
      cors_rule {
        allowed_headers    = var.blob_properties.cors_rule.allowed_headers
        allowed_methods    = var.blob_properties.cors_rule.allowed_methods
        allowed_origins    = var.blob_properties.cors_rule.allowed_origins
        exposed_headers    = var.blob_properties.cors_rule.exposed_headers
        max_age_in_seconds = var.blob_properties.cors_rule.max_age_in_seconds
      }
    }
  }
}


resource "azurerm_key_vault_secret" "sa_access_key" {
  count        = var.key_vault_id != null ? 1 : 0
  name         = var.sa_access_key_kv_secret_name
  value        = azurerm_storage_account.storage_account.primary_access_key
  key_vault_id = var.key_vault_id
  content_type = "key"
  depends_on   = [azurerm_storage_account.storage_account]
}