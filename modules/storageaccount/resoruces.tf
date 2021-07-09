resource "azurerm_resource_group" "komal-rg1" {
  name     = var.resourcegroup
  location = "Central India"
}

resource "azurerm_storage_account" "komal-sa" {
  name                     = var.storageaccount
  resource_group_name      = azurerm_resource_group.komal-rg1.name
  location                 = azurerm_resource_group.komal-rg1.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "komal-sc" {
  name                  = var.containername
  storage_account_name  = azurerm_storage_account.komal-sa.name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "komalblob" {
  name                   = "komalblob"
  storage_account_name   = azurerm_storage_account.komal-sa.name
  storage_container_name = azurerm_storage_container.komal-sc.name
  type                   = "Block"
  source                 = "C:/Users/komal.pratap.jadhav/Desktop/AZURE/Terraform/Demo5Modules/modules/storageaccount/Demo.zip"
}