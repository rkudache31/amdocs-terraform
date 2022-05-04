vnet_name="vent-test3"
vnet_resource_group_name="test2"
vnet_location="eastus"
subnet=["subnet1","subnet2","subnet3"]
val=["11.0.1.0/24","11.0.2.0/24","11.0.3.0/24"]
val1=["azr_subnet_1","azr_subnet_2","azr_subnet_3"]
location="eastus"
resource_group_name="test2"
ip_conf=["ip_conf1","ip_conf2","ip_conf3"]
anint=["anint1","anint2","anint3"]

subnets = {
  subnet1 = {
  name  = "shr_subnet1"
  virtual_network_name= "vent-test3"
  resource_group_name = "test2"
  address_prefixes = ["11.0.4.0/24"]
}

 subnet2 = {
  name = "shr_subnet2"
  resource_group_name = "test2"
  virtual_network_name= "vent-test3"
  address_prefixes = ["11.0.5.0/24"]
}

 subnet3 = {
  name = "shr_subnet3"
 resource_group_name = "test2"
 virtual_network_name= "vent-test3"
  address_prefixes = ["11.0.6.0/24"]
}
}


anet = {
  anet1 = {
   subnet_val_key="subnet1"
   ip_conf="ip_conf1"
   anint="anint1"
}
 anet1 = {
   subnet_val_key="subnet2"
  ip_config="ip_conf2"
  anint="anint2"
}
 anet1 = {
   subnet_val_key="subnet3"
   ip_conf="ip_conf3"
   anint="anint3"
}
}

/*
subnets = {
  subnet1 = {
  name  = "shr_subnet1"
  virtual_network_name= "vent-test3"
  resource_group_name = "test2"
  address_prefixes = ["11.0.4.0/24"]
}

 subnet2 = {
  name = "shr_subnet2"
  resource_group_name = "test2"
  virtual_network_name= "vent-test3"
  address_prefixes = ["11.0.5.0/24"]
}

 subnet3 = {
  name = "shr_subnet3"
 resource_group_name = "test2"
 virtual_network_name= "vent-test3"
  address_prefixes = ["11.0.6.0/24"]
}
}
*/
