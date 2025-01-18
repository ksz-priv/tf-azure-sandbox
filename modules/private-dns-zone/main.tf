resource "azurerm_private_dns_zone" "private_dns_zone" {
  name                = var.dns_zone_name
  resource_group_name = var.rg_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "dns_link" {
  name                  = "link"
  resource_group_name   = var.rg_name
  private_dns_zone_name = azurerm_private_dns_zone.private_dns_zone.name
  virtual_network_id    = var.vnet_id
}