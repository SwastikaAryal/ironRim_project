resource "azurerm_storage_account" "storage_account" {
  count                    = var.create_storage ? var.instance_count : 0
  name                     = "${var.account_name}-${count.index}"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type

  network_rules {
    default_action             = var.default_action
    virtual_network_subnet_ids = [var.subnet_id]
  }

  tags = {
    environment = var.environment
  }

  lifecycle {
    create_before_destroy = true
  }
}
w