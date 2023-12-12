11-12-2023

How to install Azure Cli in your local machine ?

For this I have use my local Ubuntu 20.04 local machine to install Azure Cli, Mainly we will install Azure Cli in the local machine for it allows you to interact with Azure resources, manage and deploy services, and automate tasks from the command line.
 
Follow the below steps to Install :

	sudo apt-get update

We will use above command to refresh the local package index. When you run this command, it contacts the configured package repositories and downloads information about the latest available packages and their versions.

	sudo apt-get install ca-certificates curl apt-transport-https lsb-release gnupg

We will use this above command to get packages needed for the installation process. It is commonly we used for working with secure connections, particularly when interacting with external repositories and services.

	sudo mkdir -p /etc/apt/keyrings

We will use this command for creating a directory in the particular path which we given.

	curl -sLS https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /etc/apt/keyrings/microsoft.gpg > /dev/null

We will use this above command for to download a GPG (GNU Privacy Guard) key from the specified URL, convert it to the GPG keyring format, and save it to the /etc/apt/keyrings directory as microsoft.gpg.

	sudo chmod go+r /etc/apt/keyrings/microsoft.gpg

We will use this above command for changing the file permissions of the Microsoft GPG keyring file (microsoft.gpg) to make it readable by all users on the system.

	AZ_DIST=$(lsb_release -cs)

We will use above command for to assign the codename of the Linux distribution to the variable AZ_DIST.

	echo "deb [arch=`dpkg --print-architecture` signed-by=/etc/apt/keyrings/microsoft.gpg] https://packages.microsoft.com/repos/azure-cli/ $AZ_DIST main" | sudo tee /etc/apt/sources.list.d/azure-cli.list

We will use the above command is to dynamically generate and add a repository configuration for the Azure CLI to the system's package manager (apt). The repository configuration line is written to a file in the /etc/apt/sources.list.d/ directory, allowing apt to recognize and use the Azure CLI repository when fetching and installing packages.


	sudo apt-get update
	sudo apt-get install azure-cli

We will run this command, it communicates with the package manager (apt) and instructs it to download and install the Azure CLI package and its dependencies. The package manager will then take care of resolving dependencies, fetching the necessary files from the configured repositories, and installing them on the system.

	az –version

We will use the above command to check the version Azure Cli which we installed in our local machine by following the above steps.
