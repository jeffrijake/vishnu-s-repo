Practicing of Jenkins Pipeline Job?

Step -1 - I have launched one aws ec2 linux instance.

Step -2 - I have installed Jenkins in that linux instance with all the requirements like Installing java and enabling port 8080 like that and i have given the below commands to install.

	sudo yum update
	
	sudo yum install java-1.8.0-openjdk-devel
	
	sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
	
	sudo yum install jenkins
	
	sudo systemctl start jenkins
	
	sudo systemctl enable jenkins

Step -3 - After that i have configured the jenkins with admin username and password and after that i have installed the required plugins and i have launched the jenkins.

Step -4 - After that i have installed the **Git Plugin and Git server plugin** to integrate my git repo with the jenkins.

Step -5 -  After that i have push one small terraform code in .tf file to my repo which i have integrated with jenkins. Find the code below:

	provider "aws"{
	
	 region  = "us-east-1"
	
	}
	
	resource "aws_instance" "My_Demo_1" {
	  ami = "ami-02f3f602d23f1659d"
	  instance_type = var.instance_type
	  subnet_id = "subnet-eddcdzz4"
	
	  tags = {
	    Name = "My_Demo_1"
	  }
	
	  provisioner "remote-exec" {
	    inline = [
	      "sudo yum update",
	      "sudo yum install httpd -y",
	      "sudo echo '<h1>Hello World For Practice</h1>'> /var/www/html/index.html",
	      "sudo systemctl start httpd"
	    ]
	  }
	}
	
	resource "aws_security_group" "my-sg-2" {
	  name_prefix = "my-sg-2"
	
	  ingress {
	    from_port   = 80
	    to_port     = 80
	    protocol    = "tcp"
	    cidr_blocks = ["0.0.0.0/0"]
	  }
	
	  egress {
	    from_port   = 0
	    to_port     = 0
	    protocol    = "-1"
	    cidr_blocks = ["0.0.0.0/0"]
	  }
	} 

Step -6 - Now i have written pipeline code which i already shared in previous documents in .jenkinsfile.

Step -7 - Now i have configured the pipeline job in the jenkins by giving this pipele code path in that job.

Today and Yesterday i have worked on the same thing so this file for the both days work which i have done.