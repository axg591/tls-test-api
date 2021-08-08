terraform{
required_providers{
azurerm={
source="hashicrop/azurerm"
version="2.70.0"
}}}

provider "azurerm"{

features{}
#Configuration options
}

resource "azurerm_resource_group" "example"{
name=var.rg_name
location="EastUS2"
}

resource "azurerm_app_service_plan" "example" {
  name                = "test-appservice-plan"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  app_service_plan_id = azurerm_app_service_plan.example.id

  sku {
    tier = "Standard"
    size = "S1"
  }

  site_config {
    dotnet_framework_version = "v4.0"
    scm_type                 = "LocalGit"
  }
}