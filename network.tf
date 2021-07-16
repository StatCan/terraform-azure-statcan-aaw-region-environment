###########################################################
# NETWORK RESOURCE GROUP
###########################################################
# Resource group to store network-related resources.
###########################################################
resource "azurerm_resource_group" "network" {
  name     = "${local.prefix}-rg-network"
  location = var.azure_region
  tags     = local.azure_tags

  lifecycle {
    ignore_changes = [tags.DateCreatedModified]
  }
}

# The principal running the terraform needs to be
# an "Owner" on the resource group in order
# to deploy resources and assign permission.
resource "azurerm_role_assignment" "network_rg_owner_ci" {
  scope                = azurerm_resource_group.network.id
  role_definition_name = "Owner"
  principal_id         = data.azurerm_client_config.current.object_id
}


###########################################################
# NETWORK WATCHER
###########################################################
resource "azurerm_network_watcher" "network_watcher" {
  name                = "${local.prefix}-nw"
  location            = var.azure_region
  resource_group_name = azurerm_resource_group.network.name
  tags                = local.azure_tags

  lifecycle {
    ignore_changes = [tags.DateCreatedModified]
  }
}
