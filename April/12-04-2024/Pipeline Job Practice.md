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

Step -5 -  After that i have push one small terraform code in .tf file to my repo which i have integrated with jenkins. 

Step -6 - Now i have written pipeline code which i already shared in previous documents in .jenkinsfile. Find the code below again:

	pipeline {
		    agent any
		    
		    stages {
		        stage('Checkout') {
		            steps {
		                // Checkout the Terraform scripts from the GitHub repository
		                git 'https://github.com/vishnuparuchuri/vishnutest.git'
		            }
		        }
		        
		        stage('Terraform Init') {
		            steps {
		                // Initialize the Terraform working directory
		                sh 'terraform init'
		            }
		        }
		        
		        stage('Terraform Plan') {
		            steps {
		                // Generate an execution plan
		                sh 'terraform plan -out=tfplan'
		            }
		        }
		        
		        stage('Terraform Apply') {
		            steps {
		                // Apply the changes
		                sh 'terraform apply -auto-approve tfplan'
		            }
		        }
		    }
		}

Step -7 - Now i have configured the pipeline job in the jenkins by giving this pipele code path in that job.

Today and Yesterday i have worked on the same thing so this file for the both days work which i have done.