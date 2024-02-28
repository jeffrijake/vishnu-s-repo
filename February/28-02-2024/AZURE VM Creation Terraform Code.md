While i am trying to create AZURE VM with VNETS and Subnets and NSG i am getting errors so i tried to solve that.

Error - 1 - Today in my observation i came to know that previously i didnt even mention subscription key in the providers block today i added that but my previous azure account has blocked so i need to create new azure account and i need to mention that subscription id

Error -2 - In the Script of Creation VM Everythiy Attribute is showing error so tomorrow i will create new azure acccount and i will try to give some correct hardcoded values to fix that errors in the script.

    provider "azurerm" {
	      features {}
	
	      subscription_id = "your-subscription-id"
	    }
	
		# Create a resource group
		resource "azurerm_resource_group" "my-rsg" {
		  name     = "my-rsg"
		  location = "East US"  # Change this to your desired Azure region
		}
	
	# Create a virtual network
	resource "azurerm_virtual_network" "my-vnet" {
	  name                = "my-vnet"
	  resource_group_name = azurerm_resource_group.my-rsg.name
	  location            = azurerm_resource_group.my-rsg.location
	  address_space       = ["10.0.0.0/16"]
	}
	
	# Create a subnet
	resource "azurerm_subnet" "my-subnet" {
	  name                 = "my-subnet"
	  resource_group_name  = azurerm_resource_group.my-rsg.name
	  virtual_network_name = azurerm_virtual_network.my-vnet.name
	  address_prefixes     = ["10.0.1.0/24"]
	}
	
	# Create a network security group
	resource "azurerm_network_security_group" "my-nsg" {
	  name                 = "my-nsg"
	  resource_group_name = azurerm_resource_group.my-rsg.name
	  location            = azurerm_resource_group.my-rsg.location
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
	  resource_group_name         = azurerm_resource_group.my-rsg.name
	  network_security_group_name = azurerm_network_security_group.my-nsg.name
	}
	
	# Create a network interface with NSG
	resource "azurerm_network_interface" "my-nic" {
	  name                      = "my-nic"
	  resource_group_name       = azurerm_resource_group.my-rsg.name
	  location                  = azurerm_resource_group.my-rsg.location
	
	  ip_configuration {
	    name                          = "ipconfig1"
	    subnet_id                     = azurerm_subnet.my-subnet.id
	    private_ip_address_allocation = "Dynamic"
	    public_ip_address_id          = null
	  }
	
	}
	
	# Create a Windows virtual machine
	resource "azurerm_windows_virtual_machine" "my-vm" {
	  name                  = "my-vm"
	  resource_group_name   = azurerm_resource_group.my-rsg.name
	  location              = azurerm_resource_group.my-rsg.location
	  network_interface_ids = [azurerm_network_interface.my-nic.id]
	  vm_size               = "Standard_DS1_v2"
	
	  # Specify the operating system disk settings
	  storage_os_disk {
	    name              = "example-osdisk"
	    caching           = "ReadWrite"
	    create_option     = "FromImage" # Use "FromImage" to create OS disk from a VM image
	    managed_disk_type = "Premium_LRS"
	  }
	
	  # Specify the operating system settings
	  os_profile {
	    computer_name  = "examplevm"
	    admin_username = "adminuser"
	    admin_password = "AdminPassword1234!" # Replace with your desired password
	  }
	
	  # Specify the VM image to use
	  storage_image_reference {
	    publisher = "MicrosoftWindowsServer"
	    offer     = "WindowsServer"
	    sku       = "2019-Datacenter"
	    version   = "latest"
	  }
	}
