provider "azurerm" {
  features {}
  subscription_id = "e1cdd60a-6598-458c-82c6-bd73262ebbc6"
}

resource "azurerm_resource_group" "this" {
  name     = "rg-jenkins"
  location = var.location
}

resource "azurerm_service_plan" "this" {
  name                = "appserviceplan-jenkins"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  os_type             = "Linux"

  sku_name = "B1"
}

resource "azurerm_linux_web_app" "this" {
  name                = "webapitarun123"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  service_plan_id     = azurerm_service_plan.this.id  # Updated attribute

  site_config {
    always_on = true
  }
}
