resource "azurerm_storage_container" "container" {
  for_each              = var.container
  name                  = each.value.name
  storage_account_name  = each.value.storage_account_name
  container_access_type = each.value.containerAccTyp
}

output "container1" {
  value = azurerm_storage_container.container["container1"]
}
output "container2" {
  value = azurerm_storage_container.container["container2"]
}
