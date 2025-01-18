module "naming" {
source              = "../naming"
  project             = var.project
  environment         = var.environment
  characteristic_name = var.characteristic_name
}

resource "azurerm_private_endpoint" "private_endpoint" {
  name                          = module.naming.private_endpoint
  resource_group_name           = var.rg_name
  location                      = var.location
  subnet_id                     = var.subnet_id

  private_service_connection {
    name                           = var.private_endpoint_connection.name
    is_manual_connection           = var.private_endpoint_connection.is_manual
    private_connection_resource_id = var.private_endpoint_connection_resource_id
    subresource_names              = var.private_endpoint_connection.subresource_names
  }

  dynamic "private_dns_zone_group" {
    for_each = length(var.private_dns_zone_ids) != 0 ? [1] : []
    content {
      name                 = "dns-zone-group"
      private_dns_zone_ids = var.private_dns_zone_ids
    }
  }
}
