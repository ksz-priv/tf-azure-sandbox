locals {
  private_endpoint_connection = {
    name              = "db-prv-connection"
    is_manual         = false
    subresource_names = ["sqlServer"]
  }
}
