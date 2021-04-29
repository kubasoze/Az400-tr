resource "azurerm_resource_group" "az400terraform" {
  name     = "az400terraform"
  location = "West Europe"
}

resource "azurerm_app_service_plan" "az400serviceplan" {
  name                = "az400serviceplan"
  location            = azurerm_resource_group.az400terraform.location
  resource_group_name = azurerm_resource_group.az400terraform.name

  sku {
    tier = "Standard"
    size = "S1"
  }
}