
module "naming" {
  source              = "./modules/naming"
  project             = var.project_name
  environment         = terraform.workspace
  characteristic_name = ""
}

module "resource_group" {
  source      = "./modules/resource-group"
  project     = var.project_name
  environment = terraform.workspace
  location    = var.location
  tags        = local.tags
}


