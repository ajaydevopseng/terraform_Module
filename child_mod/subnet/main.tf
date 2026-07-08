resource "azurerm_subnet" "subnet" {
  for_each             = var.subnet
  name                 = each.value.name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
  address_prefixes     = [each.value.address_prefix]
}

output "subnet1" {
  value = azurerm_subnet.subnet["subnet1"]
}
output "subnet2" {
  value = azurerm_subnet.subnet["subnet2"]
}
output "subnet3" {
  value = azurerm_subnet.subnet["subnet3"]
}
output "subnet4" {
  value = azurerm_subnet.subnet["subnet4"]
}
