resource "azurerm_linux_virtual_machine" "linuxvm" {
 for_each = var.web_linux_instance_count
    name                = "${local.resource_name_prefix}-nic-${each.key}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  size                = "Standard_F2"
  admin_username      = "adminuser"
  admin_password      =  "Admin@123456"
   disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.web_linux_nic[each.key].id,
  ]

    os_disk {
        name = "osdisk-${each.key}"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  custom_data = filebase64("${path.module}/app/app.sh")
}