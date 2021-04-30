data "azurerm_container_registry" "spark_registry" {
  name                = "400azureterraform"
  resource_group_name = "az400terraform"
}