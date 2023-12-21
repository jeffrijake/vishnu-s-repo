While i am trying to launch a Virtual Machine with Network security group and Azure V-Net with Azure Subnet i am facing some issues in the code while giving **terraform plan** command it is showing some errors in the code which i was written the below code i have written i am trying to fix the code mainly with the creating network security group and in creating VM i have to work on it.


    provider "azurerm" {
      features = {}
    }

	# Create a resource group
	resource "azurerm_resource_group" "example" {
	  name     = "your-resource-group"
	  location = "East US"  # Change this to your desired Azure region
	}

	# Create a virtual network
	resource "azurerm_virtual_network" "vnet" {
	  name                = "my-vnet"
	  resource_group_name = azurerm_resource_group.example.name
	  location            = azurerm_resource_group.example.location
	  address_space       = ["10.0.0.0/16"]
	}
	
	# Create a subnet
	resource "azurerm_subnet" "subnet" {
	  name                 = "my-subnet"
	  resource_group_name  = azurerm_resource_group.example.name
	  virtual_network_name = azurerm_virtual_network.vnet.name
	  address_prefixes     = ["10.0.1.0/24"]
	}
	
	# Create a network security group
	resource "azurerm_network_security_group" "sg" {
	  name                 = "my-nsg"
	  resource_group_name = azurerm_resource_group.example.name
	}
	
	# Create a network security group rule (allow inbound SSH)
	resource "azurerm_network_security_rule" "sg" {
	  name                        = "AllowSSH"
	  priority                    = 1001
	  direction                   = "Inbound"
	  access                      = "Allow"
	  protocol                    = "Tcp"
	  source_port_range           = "*"
	  destination_port_range      = "3389"
	  source_address_prefix       = "*"
	  destination_address_prefix  = "*"
	  resource_group_name         = azurerm_resource_group.example.name
	  network_security_group_name = azurerm_network_security_group.sg.name
	}
	
	# Create a network interface with NSG
	resource "azurerm_network_interface" "nic" {
	  name                      = "your-nic"
	  resource_group_name       = azurerm_resource_group.example.name
	  location                  = azurerm_resource_group.example.location
	
	  ip_configuration {
	    name                          = "ipconfig1"
	    subnet_id                     = azurerm_subnet.subnet.id
	    private_ip_address_allocation = "Dynamic"
	  }
	
	  network_security_group_ids = [azurerm_network_security_group.sg.id]
	}
	
	# Create a Windows virtual machine
	resource "azurerm_windows_virtual_machine" "example" {
	  name                  = "my-vm"
	  resource_group_name   = azurerm_resource_group.example.name
	  location              = azurerm_resource_group.example.location
	  size                  = "Standard_DS1_v2"  # Choose an appropriate VM size
	  admin_username        = "administator"
	  admin_password        = "Vishnu@94"
	  network_interface_ids = [azurerm_network_interface.nic.id]
	  source_image_reference {
	    publisher = "MicrosoftWindowsServer"
	    offer     = "WindowsServer"
	    sku       = "2019-Datacenter"
	    version   = "latest"
	  }
	}