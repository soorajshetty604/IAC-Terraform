resource "azurerm_resource_group" "resource_group" {
  name     = "testingresourcegroup"
  location =  var.geo_location
}