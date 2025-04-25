# # This file is used to create Virtual Machines in each side: AWS <-> Azure
# # and ping them through their local networks (no public IP)

# ##########
# # Azure
# ##########

# resource "azurerm_public_ip" "public_ip_vm" {
#   name                = "public_ip_vm"
#   location            = azurerm_resource_group.resource_group.location
#   resource_group_name = azurerm_resource_group.resource_group.name
#   allocation_method   = "Static"
# }

# resource "azurerm_network_interface" "network_interface_vm" {
#   name                = "network_interface_vm"
#   location            = azurerm_resource_group.resource_group.location
#   resource_group_name = azurerm_resource_group.resource_group.name
  
#   ip_configuration {
#     name                          = "internal"
#     subnet_id                     = azurerm_subnet.subnet_1.id
#     private_ip_address_allocation = "Dynamic"
#     public_ip_address_id          = azurerm_public_ip.public_ip_vm.id
#   }
# }

# resource "azurerm_linux_virtual_machine" "vm" {
#   name                = "vm"
#   location            = azurerm_resource_group.resource_group.location
#   resource_group_name = azurerm_resource_group.resource_group.name
#   size                = "Standard_B1s"
#   admin_username      = "ubuntu"
#   network_interface_ids = [
#     azurerm_network_interface.network_interface_vm.id,
#   ]
#   os_disk {
#     caching              = "ReadWrite"
#     storage_account_type = "Standard_LRS"
#   }
#   admin_ssh_key {
#     username = "ubuntu"
#     # Public Key in env var(.envrc)
#     public_key = ""
#   }
#   source_image_reference {
#     publisher = "Canonical"
#     offer     = "0001-com-ubuntu-server-jammy"
#     sku       = "22_04-lts-gen2"
#     version   = "latest"
#   }
# }

# output "azure_vm_public_ip" {
#   value = azurerm_linux_virtual_machine.vm.public_ip_address
# }

# output "azure_vm_private_ip" {
#   value = azurerm_linux_virtual_machine.vm.private_ip_address
# }

# ##########
# # AWS
# ##########

# resource "aws_security_group" "ssh" {
#   vpc_id = aws_vpc.vpc.id
#   ingress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   tags = {
#     Name = "luna-security_group_ssh"
#   }
# }

# resource "aws_key_pair" "ssh_key" {
#   key_name = "ssh_key"
#   # Public Key in env var(.envrc)
#   public_key = ""
# }

# # Retrieves Ubuntu AMI for AWS image
# data "aws_ami" "ubuntu" {
#   most_recent = true
#   owners      = ["099720109477"] # Owner is Canonical

#   filter {
#     name   = "name"
#     values = ["ubuntu/images/hvm-ssd/ubuntu-*-22.04-amd64-server-*"]
#   }

#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }
# }

# resource "aws_instance" "vm" {
#   ami           = data.aws_ami.ubuntu.id
#   instance_type = "t2.micro"

#   vpc_security_group_ids      = [aws_security_group.ssh.id]
#   subnet_id                   = aws_subnet.subnet_1.id
#   associate_public_ip_address = true
#   key_name                    = aws_key_pair.ssh_key.key_name
# }