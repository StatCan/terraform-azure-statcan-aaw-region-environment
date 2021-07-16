locals {

  // The naming convention of resources within
  // this environment is:
  //
  //   $app-$env-$region-$type-$num
  //
  // The common prefix is $app-$env-$region
  // which this local variable provides.
  prefix = "${var.prefixes.application}-${var.prefixes.environment}-${var.prefixes.location}"

  // Azure tags
  azure_tags = merge({ DateCreatedModified = "" }, var.azure_tags)
}

data "azurerm_client_config" "current" {}
