resource "azurerm_resource_group" "az400terraform" {
  name     = "az400terraform"
  location = "West Europe"
}

resource "azurerm_app_service_plan" "az400serviceplanjs" {
  name                = "az400serviceplanjs"
  location            = azurerm_resource_group.az400terraform.location
  resource_group_name = azurerm_resource_group.az400terraform.name

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "az400app_servicejs" {
  name                = "WebApp-az400js"
  location            = azurerm_resource_group.az400terraform.location
  resource_group_name = azurerm_resource_group.az400terraform.name
  app_service_plan_id = azurerm_app_service_plan.az400serviceplanjs.id

   app_settings = {
    "APPINSIGHTS_INSTRUMENTATIONKEY" = azurerm_application_insights.az400insigtsjs.instrumentation_key
  }
}

resource "azurerm_application_insights" "az400insigtsjs" {
  name                = "tf-test-appinsightsjs"
  location            = azurerm_resource_group.az400terraform.location
  resource_group_name = azurerm_resource_group.az400terraform.name
  application_type    = "web"
}