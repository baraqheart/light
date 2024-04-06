# create Log Analytics 

resource "random_id" "az-random" {
  keepers = {
    # Generate a new id each time we switch to a new resource group
    group_name = azurerm_resource_group.light_rg.name
  }

  byte_length = 8
}

resource "azurerm_log_analytics_workspace" "log_workspace" {
  name                = "k8s-workspace-${random_id.az-random.hex}"
  location            = azurerm_resource_group.light_rg.location
  resource_group_name = azurerm_resource_group.light_rg.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
  tags                = var.tags
}

resource "azurerm_log_analytics_solution" "log_solution" {
  solution_name         = "ContainerInsights"
  location              = azurerm_resource_group.light_rg.location
  resource_group_name   = azurerm_resource_group.light_rg.name
  workspace_resource_id = azurerm_log_analytics_workspace.log_workspace.id
  workspace_name        = azurerm_log_analytics_workspace.log_workspace.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/ContainerInsights"
  }
}
