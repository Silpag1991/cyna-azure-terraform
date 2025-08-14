resource "azurerm_subnet" "websubnet" {
  name                = "${local.resource_name_prefix}-${var.web_subnet_name}"
  resource_group_name = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes = var.web_subnet_address
}

resource "azurerm_subnet" "dbsubnet" {
  name = "${local.resource_name_prefix}-${var.db_subnet_name}"
  resource_group_name = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes = var.db_subnet_address  
}

#lets create NSG and open the port
resource "azurerm_network_security_group" "web_subnet_nsg" {
  name = "${local.resource_name_prefix}-nsg"
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  }

  #NSg need to be part of subnet also
  resource "azurerm_subnet_network_security_group_association" "web_subnet_nsg_associate" {
  subnet_id = azurerm_subnet.websubnet.id
  network_security_group_id = azurerm_network_security_group.web_subnet_nsg.id
    }
locals {
  web_inbound_ports_maps = {
    "110" : "22"
    "120" : "80"
    "130" : "443"
  }
}
    resource "azurerm_network_security_rule" "web_nsg_rule_inbound" {

        for_each = local.web_inbound_ports_maps
  name                        = "Rule-port-${each.value}"
  priority                    = each.key
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = each.value
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.web_subnet_nsg.name
}