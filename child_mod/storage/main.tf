resource "azurerm_storage_account" "storage" {
  for_each                 = var.storage
  name                     = each.value.name
  resource_group_name      = each.value.resource_group_name
  location                 = each.value.location
  account_tier             = each.value.accountTier
  account_replication_type = each.value.accountRepTyp
}

output "storage1" {
  value = azurerm_storage_account.storage["storage1"]
}
output "storage2" {
  value = azurerm_storage_account.storage["storage2"]
}
