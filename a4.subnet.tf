resource "azurerm_subnet" "websubnet" {
  name = var.web_subnet_name
  resource_group_name = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes = var.web_subnet_address
}

resource "azurerm_subnet" "dbsubnet" {
  name = var.db_subnet_name
  resource_group_name = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes = var.db_subnet_address  
}