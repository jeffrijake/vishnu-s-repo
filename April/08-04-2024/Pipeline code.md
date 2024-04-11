Pipeline code for the terraform ?

For writing this code in visual studio code first we need to create a .jenkinsfile in the vscode.

In that .jenkinsfile we need to write the below code.

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