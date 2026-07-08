resource "azurerm_resource_group" "rg" {
  for_each = var.rg
  name     = each.value.name
  location = each.value.location
}
output "rg1" {
  value = azurerm_resource_group.rg["rg1"]
}
output "rg2" {
  value = azurerm_resource_group.rg["rg2"]
}
