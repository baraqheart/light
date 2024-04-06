# create storage account and class

resource "azurerm_storage_account" "light_storage_acc" {
  name                     = "${local.projectName}storacc098"
  resource_group_name      = azurerm_resource_group.light_rg.name
  location                 = azurerm_resource_group.light_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = var.tags
}

