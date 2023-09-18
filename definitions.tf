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
  azure_tags = merge(
    var.tags,
    {
      ModuleName    = "terraform-azure-statcan-aaw-region-environment",
      ModuleVersion = "2.0.2",
    }
  )
}

data "azurerm_client_config" "current" {}
