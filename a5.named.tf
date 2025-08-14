locals {
  owner = var.business_desicion
  environment = var.environment
  resource_name_prefix = "${var.business_desicion}-${var.environment}"


    common_tags = {
    owners = local.owner
    environment = local.environment
  }
}