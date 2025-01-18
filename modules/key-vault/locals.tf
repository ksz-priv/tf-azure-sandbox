locals {
private_endpoint_connection = {
    name              = "kv-prv-connection"
    is_manual         = false
    subresource_names = ["vault"]
  }
}