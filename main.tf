provider "azurerm" {

version = "~> 2.10.0"
features {}
}

resource "azurerm_resource_group" "dp2" {
name = "test3"
location = "eastus"
}

resource "azurerm_virtual_network" "vn1" {
name= "test-vnet"
address_space =["10.0.0.0/16"]
location=azurerm_resource_group.dp2.location
resource_group_name=azurerm_resource_group.dp2.name
}

resource "azurerm_subnet" "sub1" {
name= "subnet1"
resource_group_name=azurerm_resource_group.dp2.name
virtual_network_name= azurerm_virtual_network.vn1.name
address_prefixes = ["10.0.2.0/24"]
}

resource "azurerm_storage_account" "stg1" {
name="stgravitest1267"
resource_group_name=azurerm_resource_group.dp2.name
location=azurerm_resource_group.dp2.location
account_tier="standard"
account_replication_type="LRS"
}