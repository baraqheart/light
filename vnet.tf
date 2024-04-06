# create Virtual Network 

resource "azurerm_virtual_network" "vnet" {
  name                = "${local.projectName}-vnet"
  address_space       = [element(var.network, 0)]
  location            = azurerm_resource_group.light_rg.location
  resource_group_name = azurerm_resource_group.light_rg.name
}



resource "azurerm_public_ip" "pub_ip" {
  name                = "acceptanceTestPublicIp1"
  resource_group_name = azurerm_resource_group.light_rg.name
  location            = azurerm_resource_group.light_rg.location
  allocation_method   = "Static"

  tags = var.tags
}