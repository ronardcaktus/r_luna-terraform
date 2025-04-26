############################
# AWS Standard Networking
############################

resource "aws_vpc" "vpc" {
  cidr_block = "192.168.0.0/16"

  tags = {
    Name = "luna-vpc"
  }
}

resource "aws_subnet" "subnet_1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "192.168.1.0/24"

  tags = {
    Name = "luna-subnet_1"
  }
}

resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "luna-internet_gateway"
  }
}

resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "luna-route_table"
  }
}

# Enabling the resources from subnet_1 to access the Internet
resource "aws_route" "subnet_1_exit_route" {
  route_table_id         = aws_route_table.route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.internet_gateway.id
}

resource "aws_route_table_association" "route_table_association" {
  subnet_id      = aws_subnet.subnet_1.id
  route_table_id = aws_route_table.route_table.id
}



############################# 
# AWS <-> Azure VPN Config
#############################

# These two fetch Azure's public IPs _exactly_ 
# since Public IPs need to be dynamic
data "azurerm_public_ip" "azure_public_ip_1" {
  name                = "${azurerm_virtual_network_gateway.virtual_network_gateway.name}_public_ip_1"
  resource_group_name = azurerm_resource_group.resource_group.name
}

data "azurerm_public_ip" "azure_public_ip_2" {
  name                = "${azurerm_virtual_network_gateway.virtual_network_gateway.name}_public_ip_2"
  resource_group_name = azurerm_resource_group.resource_group.name
}

resource "aws_customer_gateway" "customer_gateway_1" {
  bgp_asn = 65000
  # Using the fetched public IPs from Azure
  ip_address = data.azurerm_public_ip.azure_public_ip_1.ip_address
  type       = "ipsec.1"

  tags = {
    Name = "customer_gateway_1"
  }
}

resource "aws_customer_gateway" "customer_gateway_2" {
  bgp_asn    = 65000
  ip_address = data.azurerm_public_ip.azure_public_ip_2.ip_address
  type       = "ipsec.1"

  tags = {
    Name = "customer_gateway_2"
  }
}

resource "aws_vpn_gateway" "vpn_gateway" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "luna-vpn_gateway"
  }
}

# Info from resources below are used to connect from Azure to AWS
resource "aws_vpn_connection" "vpn_connection_1" {
  vpn_gateway_id      = aws_vpn_gateway.vpn_gateway.id
  customer_gateway_id = aws_customer_gateway.customer_gateway_1.id
  type                = "ipsec.1"
  static_routes_only  = true

  tags = {
    Name = "luna-vpn_connection_1"
  }
}

resource "aws_vpn_connection" "vpn_connection_2" {
  vpn_gateway_id      = aws_vpn_gateway.vpn_gateway.id
  customer_gateway_id = aws_customer_gateway.customer_gateway_2.id
  type                = "ipsec.1"
  static_routes_only  = true

  tags = {
    Name = "luna-vpn_connection_2"
  }
}

resource "aws_vpn_connection_route" "vpn_connection_route_1" {
  # Azure's vnet CIDR
  destination_cidr_block = tolist(azurerm_virtual_network.vnet.address_space)[0]
  vpn_connection_id      = aws_vpn_connection.vpn_connection_1.id
}

resource "aws_vpn_connection_route" "vpn_connection_route_2" {
  # Azure's vnet CIDR
  destination_cidr_block = tolist(azurerm_virtual_network.vnet.address_space)[0]
  vpn_connection_id      = aws_vpn_connection.vpn_connection_2.id
}

# The route teaching where to go to get to Azure's CIDR
resource "aws_route" "route_to_azure" {
  route_table_id = aws_route_table.route_table.id
  # Azure's vnet CIDR
  destination_cidr_block = tolist(azurerm_virtual_network.vnet.address_space)[0]
  gateway_id             = aws_vpn_gateway.vpn_gateway.id
}
