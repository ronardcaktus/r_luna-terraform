## All resources created successfully

```sh
    cloud-2-cloud-vpn !2 ?2 > terraform apply    

    aws_vpc.vpc: Refreshing state... [id=vpc-065512a20cc6708e7]
    aws_vpn_gateway.vpn_gateway: Refreshing state... [id=vgw-004040142c07fb303]
    aws_internet_gateway.internet_gateway: Refreshing state... [id=igw-078d6bd4a29b6407f]
    aws_subnet.subnet_1: Refreshing state... [id=subnet-03e0c93ce44872c9f]
    aws_route_table.route_table: Refreshing state... [id=rtb-074a7c6d548242534]
    aws_route.subnet_1_exit_route: Refreshing state... [id=r-rtb-074a7c6d5482425341080289494]
    aws_route_table_association.route_table_association: Refreshing state... [id=rtbassoc-0011dbc71a33ae14d]
    azurerm_resource_group.resource_group: Refreshing state... [id=/subscriptions/834c8102-436c-4f3a-9b08-4992e7798b8d/resourceGroups/resource_group]
    azurerm_public_ip.public_ip_1: Refreshing state... [id=/subscriptions/834c8102-436c-4f3a-9b08-4992e7798b8d/resourceGroups/resource_group/providers/Microsoft.Network/publicIPAddresses/virtual_network_gateway_public_ip_1]
    azurerm_public_ip.public_ip_2: Refreshing state... [id=/subscriptions/834c8102-436c-4f3a-9b08-4992e7798b8d/resourceGroups/resource_group/providers/Microsoft.Network/publicIPAddresses/virtual_network_gateway_public_ip_2]
    azurerm_virtual_network.vnet: Refreshing state... [id=/subscriptions/834c8102-436c-4f3a-9b08-4992e7798b8d/resourceGroups/resource_group/providers/Microsoft.Network/virtualNetworks/vnet]
    azurerm_subnet.subnet_1: Refreshing state... [id=/subscriptions/834c8102-436c-4f3a-9b08-4992e7798b8d/resourceGroups/resource_group/providers/Microsoft.Network/virtualNetworks/vnet/subnets/subnet_1]
    azurerm_subnet.subnet_gateway: Refreshing state... [id=/subscriptions/834c8102-436c-4f3a-9b08-4992e7798b8d/resourceGroups/resource_group/providers/Microsoft.Network/virtualNetworks/vnet/subnets/GatewaySubnet]
    aws_route.route_to_azure: Refreshing state... [id=r-rtb-074a7c6d548242534179966490]
    azurerm_virtual_network_gateway.virtual_network_gateway: Refreshing state... [id=/subscriptions/834c8102-436c-4f3a-9b08-4992e7798b8d/resourceGroups/resource_group/providers/Microsoft.Network/virtualNetworkGateways/virtual_network_gateway]
    data.azurerm_public_ip.azure_public_ip_1: Reading...
    data.azurerm_public_ip.azure_public_ip_2: Reading...
    data.azurerm_public_ip.azure_public_ip_1: Read complete after 0s [id=/subscriptions/834c8102-436c-4f3a-9b08-4992e7798b8d/resourceGroups/resource_group/providers/Microsoft.Network/publicIPAddresses/virtual_network_gateway_public_ip_1]
    aws_customer_gateway.customer_gateway_1: Refreshing state... [id=cgw-0abea655e9552140c]
    data.azurerm_public_ip.azure_public_ip_2: Read complete after 0s [id=/subscriptions/834c8102-436c-4f3a-9b08-4992e7798b8d/resourceGroups/resource_group/providers/Microsoft.Network/publicIPAddresses/virtual_network_gateway_public_ip_2]
    aws_customer_gateway.customer_gateway_2: Refreshing state... [id=cgw-0f495681d978b2609]
    aws_vpn_connection.vpn_connection_1: Refreshing state... [id=vpn-0563c729c5dcf3c83]
    aws_vpn_connection.vpn_connection_2: Refreshing state... [id=vpn-0368251734046734a]
    aws_vpn_connection_route.vpn_connection_route_2: Refreshing state... [id=10.0.0.0/16:vpn-0368251734046734a]
    azurerm_local_network_gateway.local_network_gateway_2_tunnel2: Refreshing state... [id=/subscriptions/834c8102-436c-4f3a-9b08-4992e7798b8d/resourceGroups/resource_group/providers/Microsoft.Network/localNetworkGateways/local_network_gateway_2_tunnel2]
    azurerm_local_network_gateway.local_network_gateway_2_tunnel1: Refreshing state... [id=/subscriptions/834c8102-436c-4f3a-9b08-4992e7798b8d/resourceGroups/resource_group/providers/Microsoft.Network/localNetworkGateways/local_network_gateway_2_tunnel1]
    aws_vpn_connection_route.vpn_connection_route_1: Refreshing state... [id=10.0.0.0/16:vpn-0563c729c5dcf3c83]
    azurerm_local_network_gateway.local_network_gateway_1_tunnel2: Refreshing state... [id=/subscriptions/834c8102-436c-4f3a-9b08-4992e7798b8d/resourceGroups/resource_group/providers/Microsoft.Network/localNetworkGateways/local_network_gateway_1_tunnel2]
    azurerm_local_network_gateway.local_network_gateway_1_tunnel1: Refreshing state... [id=/subscriptions/834c8102-436c-4f3a-9b08-4992e7798b8d/resourceGroups/resource_group/providers/Microsoft.Network/localNetworkGateways/local_network_gateway_1_tunnel1]
    azurerm_virtual_network_gateway_connection.virtual_network_gateway_connection_1_tunnel1: Refreshing state... [id=/subscriptions/834c8102-436c-4f3a-9b08-4992e7798b8d/resourceGroups/resource_group/providers/Microsoft.Network/connections/virtual_network_gateway_connection_1_tunnel1]
    azurerm_virtual_network_gateway_connection.virtual_network_gateway_connection_1_tunnel2: Refreshing state... [id=/subscriptions/834c8102-436c-4f3a-9b08-4992e7798b8d/resourceGroups/resource_group/providers/Microsoft.Network/connections/virtual_network_gateway_connection_1_tunnel2]
    azurerm_virtual_network_gateway_connection.virtual_network_gateway_connection_2_tunnel1: Refreshing state... [id=/subscriptions/834c8102-436c-4f3a-9b08-4992e7798b8d/resourceGroups/resource_group/providers/Microsoft.Network/connections/virtual_network_gateway_connection_2_tunnel1]
    azurerm_virtual_network_gateway_connection.virtual_network_gateway_connection_2_tunnel2: Refreshing state... [id=/subscriptions/834c8102-436c-4f3a-9b08-4992e7798b8d/resourceGroups/resource_group/providers/Microsoft.Network/connections/virtual_network_gateway_connection_2_tunnel2]

    No changes. Your infrastructure matches the configuration.

    Terraform has compared your real infrastructure against your configuration and found no differences, so no changes are needed.

    Apply complete! Resources: 0 added, 0 changed, 0 destroyed.
```

### First tests
```sh
    Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

    Outputs:

    aws_vm_private_ip = "192.168.1.188"
    aws_vm_public_ip = "98.84.56.153"
    azure_vm_private_ip = "10.0.1.4"
    azure_vm_public_ip = "52.226.113.68"

    # From AWS
     > ssh ubuntu@98.84.56.153 ping 10.0.1.4 -c 4                    
    PING 10.0.1.4 (10.0.1.4) 56(84) bytes of data.
    64 bytes from 10.0.1.4: icmp_seq=1 ttl=64 time=5.59 ms
    64 bytes from 10.0.1.4: icmp_seq=2 ttl=64 time=5.80 ms
    64 bytes from 10.0.1.4: icmp_seq=3 ttl=64 time=5.20 ms
    64 bytes from 10.0.1.4: icmp_seq=4 ttl=64 time=5.78 ms

    --- 10.0.1.4 ping statistics ---
    4 packets transmitted, 4 received, 0% packet loss, time 3005ms
    rtt min/avg/max/mdev = 5.196/5.590/5.797/0.241 ms

    # From inside the VM

    ubuntu@ip-192-168-1-188:~$ ping -c 4 10.0.1.4
    PING 10.0.1.4 (10.0.1.4) 56(84) bytes of data.
    64 bytes from 10.0.1.4: icmp_seq=1 ttl=64 time=5.29 ms
    64 bytes from 10.0.1.4: icmp_seq=2 ttl=64 time=6.46 ms
    64 bytes from 10.0.1.4: icmp_seq=3 ttl=64 time=6.26 ms
    64 bytes from 10.0.1.4: icmp_seq=4 ttl=64 time=5.22 ms
    
    ubuntu@ip-192-168-1-188:~$ nc -vz 10.0.1.4 22
    Connection to 10.0.1.4 22 port [tcp/ssh] succeeded!
```


### Deleted Azure VMs and tested again


```sh
    > terraform apply 

    Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

    Outputs:

    aws_vm_private_ip = "192.168.1.188"
    aws_vm_public_ip = "98.84.56.153"
    azure_vm_private_ip = "10.0.1.4"
    azure_vm_public_ip = "52.226.113.68"
```