# create a kubernetes cluster
 
resource "azurerm_user_assigned_identity" "light_user" {
  location            = azurerm_resource_group.light_rg.location
  name                = "example"
  resource_group_name = azurerm_resource_group.light_rg.name
}

resource "azurerm_role_assignment" "role1" {
  scope                = azurerm_resource_group.light_rg.id
  role_definition_name = "Network contributor"
  principal_id         = azurerm_user_assigned_identity.light_user.principal_id
}


resource "azurerm_kubernetes_cluster" "light_kc" {
  name                = "${local.projectName}-kclust"
  location            = azurerm_resource_group.light_rg.location
  resource_group_name = azurerm_resource_group.light_rg.name
  dns_prefix          = var.dns_prefix
  kubernetes_version  = var.k8s_version 
  
  default_node_pool {
    name       = element(var.node_pool, 0)
    node_count = element(var.node_pool, 1)
    vm_size    = element(var.node_pool, 2)
    zones      = ["1", "2"]
  }
 
   identity {
    type = "UserAssigned"
    identity_ids =  [azurerm_user_assigned_identity.light_user.id]
  }

  network_profile {
    network_plugin    = element(var.network_profile, 0)
    network_policy    = element(var.network_profile, 1)
    load_balancer_sku = element(var.network_profile, 2)

  }

  oms_agent {
    log_analytics_workspace_id = azurerm_log_analytics_workspace.log_workspace.id
    msi_auth_for_monitoring_enabled = true
  }

  lifecycle {
    ignore_changes = [default_node_pool]
  }

  role_based_access_control_enabled = true

  tags = var.tags

  depends_on = [ azurerm_user_assigned_identity.light_user ]
}
