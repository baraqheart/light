terraform {
  backend "azurerm" {
    resource_group_name  = "terraformaks"
    storage_account_name = "terraformaksstorageacc2"
    container_name       = "tfstate"
    key                  = "prod.terraform.tfstate"
  }
}
