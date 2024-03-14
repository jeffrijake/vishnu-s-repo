**How to install jenkis in any linux server or local linux machine?**

To install jenkins java should be pre installed in the linux box or else we can istall along with jenkins also.

Java 8 or 11 and latest should be pre installed in the linux box.

Here i am installing the jenkins in ubuntu and centos flavours in linux but for other flavours of linux boxes we need to give their appropriate commands based on flavour of the linux box.

**Jenkins installation in Ubuntu :**

As i said above first we need to install java in the machine for that we need to give below commands accordingly.

	sudo add-apt-repository ppa:openjdk-r/ppa
Use of the above command is for to add a Personal Package Archive (PPA) to the system's list of software repositories.

	sudo apt-get update
As all of us know the above command is for update the package lists for repositories configured in the system's software sources.

	sudo apt-get install -y openjdk-11-jdk
The above command is for install the OpenJDK 11 Development Kit (JDK) on a Debian-based Linux system, such as Ubuntu.

As i said prevously we can also install latest java also as of now latest java verion is Jdk17.

Now we can install jenkins in our ubuntu machine for that follow the beolow commands.

	wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
we will give this above command for to add the GPG (GNU Privacy Guard) key needed to authenticate packages from the Jenkins Debian repository.

	echo deb https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list
This command is for to add a new software source to your system's list of repositories for APT (Advanced Package Tool) in Debian-based Linux distributions like Ubuntu.

	sudo apt-get update

	sudo apt-get install jenkins
The above command is for install Jenkins on a ubuntu mahine.

**Jenkins installation in Centos :**

Java installation in Centos -

	sudo yum -y update
The above command is used in Red Hat-based Linux distributions, such as CentOS and Fedora, to update the installed software packages to their latest available versions from the configured repositories.

	sudo yum install java-1.11.0-openjdk-devel
To install java in this flavour above command will use.

Jenkins Installation - 

	sudo yum install wget
This above command is used to install the **wget** utility.

	sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
After the installation of that utility by using that utility we will download a repository configuration file for Jenkins and save it to the directory **/etc/yum.repos.d/** with the name **jenkins.repo**.

	sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
The above command is used to import the GPG (GNU Privacy Guard) key from the Jenkins project's Red Hat repository into the RPM (Red Hat Package Manager) keyring.

	sudo yum update
The above command is used to Red Hat-based Linux distributions, such as CentOS and Fedora, to update the installed software packages to their latest available versions from the configured repositories.

	sudo yum install jenkins
To install Jenkins in this flavour above command will use.

	sudo systemctl start jenkins
This above comamnd is used to start the Jenkins Service.





