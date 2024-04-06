# create a container registry

resource "azurerm_container_registry" "light_acr" {
  name                = "${local.projectName}acregis"
  resource_group_name = azurerm_resource_group.light_rg.name
  location            = azurerm_resource_group.light_rg.location
  sku                 = "Standard"
  admin_enabled       = false
 
}
