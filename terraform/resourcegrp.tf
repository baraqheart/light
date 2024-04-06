resource "azurerm_resource_group" "light_rg" {
  name     = "${local.projectName}-rg"
  location = var.location
  tags     = var.tags
}