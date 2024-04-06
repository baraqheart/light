# create subnets

resource "azurerm_subnet" "snet1" {
  name                 = "${local.projectName}-snet1"
  resource_group_name  = azurerm_resource_group.light_rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [element(var.network, 1)]


}

resource "azurerm_subnet" "snet2" {
  name                 = "${local.projectName}-snet2"
  resource_group_name  = azurerm_resource_group.light_rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [element(var.network, 2)]


}