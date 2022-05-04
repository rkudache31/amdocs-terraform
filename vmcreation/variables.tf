variable vnet_name {
type = string
description= "Name of the vnet"
}
variable vnet_resource_group_name {
type = string 
description = "resource_group_name"
}
variable vnet_location{

type = string 
description = "location"
}
variable subnet{
type=list(string)
}
variable val{
type=list(string)
}
variable anint{
type=list(string)

}

variable resource_group_name {
}
variable location{}

variable ip_conf {
type=list(string)
}
variable val1 {
type=list(string)
}

variable "subnets" {
type=map(object({
name = string
resource_group_name = string
virtual_network_name = string
address_prefixes = list(string)
}))
}


variable "anet" {
type=map(object({
anint=string
ip_conf=string
subnet_val_key=string
}))
}
