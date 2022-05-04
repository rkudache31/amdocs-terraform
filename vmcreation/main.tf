data "azurerm_virtual_network" "vnet1" {
name=var.vnet_name
resource_group_name=var.vnet_resource_group_name
}
/*
resource "azurerm_subnet" "azr_subnet" {
for_each = var.subnet
name=var.subnet[count.index]
resource_group_name=var.vnet_resource_group_name
virtual_network_name=data.azurerm_virtual_network.vnet1.name
address_prefixes=[var.val[count.index]]
}


data "azurerm_subnet" "azr_subnet_1" {
name=var.subnet[0]
virtual_network_name=data.azurerm_virtual_network.vnet1.name
resource_group_name=var.vnet_resource_group_name
}

data "azurerm_subnet" "azr_subnet_2" {
name=var.subnet[1]
virtual_network_name=data.azurerm_virtual_network.vnet1.name
resource_group_name=var.vnet_resource_group_name
}

data "azurerm_subnet" "azr_subnet_3" {
name=var.subnet[2]
virtual_network_name=data.azurerm_virtual_network.vnet1.name
resource_group_name=var.vnet_resource_group_name
}
*/

resource "azurerm_subnet" "azr_subnet" {
for_each    = var.subnets
name =  each.value["name"]
resource_group_name= each.value["resource_group_name"]
virtual_network_name= each.value["virtual_network_name"]
address_prefixes= each.value["address_prefixes"]
}

resource "azurerm_public_ip" "pip" {
name= "mypip32"
location=var.location
resource_group_name = var.resource_group_name
allocation_method="Dynamic"
idle_timeout_in_minutes=30
}

resource "azurerm_network_interface" "ani" {
for_each = var.anet
name = each.value["anint"]
location = var.location
resource_group_name = var.resource_group_name
ip_configuration{
name= each.value["ip_conf"]
subnet_id=lookup(merge(azurerm_subnet.azr_subnet,azurerm_subnet.azr_subnet),each.value["subnet_val_key"])["id"]
private_ip_address_allocation = "Dynamic"
public_ip_address_id=azurerm_public_ip.pip.id
}
}

data "azurerm_network_security_group" "nsg" {
name="TerraformLinuxServer-nsg"
resource_group_name="tfstatedemo"
}

resource "azurerm_network_interface_security_group_association" "nsg_associat" {
network_interface_id = "/subscriptions/28e515cd-5830-4602-b343-8bfc4032d66c/resourceGroups/test2/providers/Microsoft.Network/networkInterfaces/anint3"
network_security_group_id=data.azurerm_network_security_group.nsg.id
}
