resource_group_name = "test-azure-rg"
location            = "East US"
vnet_name           = "test-azure-vnet"
vnet_cidr           = "10.0.0.0/16"
aks_subnet_name     = "test-azure-subnet"
aks_subnet_cidr     = "10.0.0.0/20"
gw_subnet_name      = "GatewaySubnet"
gw_subnet_cidr      = "10.0.16.0/27"
public_ip_name      = "test-azure-public-ip"
vnet_gw_name        = "test-azure-vnet-gw"
vnet_gw_type        = "Vpn"
vnet_gw_vpn_type    = "RouteBased"
vnet_gw_sku         = "VpnGw2AZ"
vnet_gw_generation  = "Generation2"
vpn_cidr            = "100.0.0.0/24"
vpn_root_cert       = "MIICvjCCAaYCCQCzfR7KXSD7kDANBgkqhkiG9w0BAQsFADAhMR8wHQYDVQQDDBbD osKAwp1NeUF6dXJlVlBOw6LCgMKdMB4XDTIyMTEwMzIwNTMxM1oXDTMyMTAzMTIw NTMxM1owITEfMB0GA1UEAwwWw6LCgMKdTXlBenVyZVZQTsOiwoDCnTCCASIwDQYJ KoZIhvcNAQEBBQADggEPADCCAQoCggEBALCbuD3Dbf2Vg1Bm+ERutGAGfLV6c4Pl WlrNVgudp57TaTXfpFqo8l5D7gq3hlOyd3DuXbHcogbdIAYnngm9l9+er7Ejyh/3 9CkEjZ7OevIGI2pJkazKX8qS+SbiS+Fpqvy4sfdVDI/2Tv+LJ/lmCWwM4ZGov+Ek G12VMHwdRMQ+nyd8sXgt3hbEUqVISYN+qmSkq0U0Yj5Yf1HCIF0YZlYYEnN4z/Vi +SL6O3/8WGqQu2SotyiGpF5rqz80iTpg0D+tGVpySgKGPWuEXkJKyYEbUkMCT4aH I3OTNyliEKlkx91Hkv5Uc4MF3e+gMCZGrnTLKpb5j8xqAylM+RS+v+sCAwEAATAN BgkqhkiG9w0BAQsFAAOCAQEAKXhxw6PlmWesVlxJB+CEozyc2nBj0fEBoPPTEgBY Q7+VCztCRb6uLaVbMK6P19Ay+QnbUWDzyhU2mQveH2i/G4b1vTT5nExpOGF35uEG dtwQSM1rZje9av/qPhgxMhjxfRsI1nComJWnLpyuSMuUqj0aykJZf7nHnvI1qI30 VP6qWyd7OkbeHH9NlHukLiqW/h50fvmJPWAczm+7FWhjYDrsl2f8QQfC1E8U6K84 AKAiQTN6961Z8koKTF4y2Wgcl6DOqhI2KAUlcB/BQfqlL5Qj8vAgvxmplMY8w/V5 Uxk18JeGyaQKwrSh6ABGfeRQiWU3ZAWKhnKPGhveJhknUA=="

cluster_name        = "test-az-aks"
kubernetes_version  = "1.23.12"
system_node_pool_name = "system"
system_node_count   = 1
system_min_node_count = 1
system_max_node_count = 3
system_node_vm_size = "Standard_DS2_v2"
service_cidr        = "20.1.0.0/16"
dns_service_ip      = "20.1.0.10"
docker_bridge_cidr  = "172.17.0.1/16"

bastion_name        = "test-azure-bastion"
bastion_size        = "Standard_DS2_v2"
bastion_username    = "azureuser"
bastion_password    = "P@ssw0rd1234"

acr_name            = "testacr121"
sa_name             = "testazuresa1121"

sql_server_name     = "testazuresqlserver1121"
db_user             = "ra"
db_password         = "P@ssw0rd1234"
dns_name            = "test.com"