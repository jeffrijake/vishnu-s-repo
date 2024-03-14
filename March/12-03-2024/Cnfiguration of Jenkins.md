**How to configure Jenkins web interface after the installation?**

After installing Jenkins on any linux machine, you can access the Jenkins web interface to configure it further. Here's how you can do it:

Step -1 : Access Jenkins Web Interface:

- Open a web browser on your local machine.
- Enter the URL http://localhost:8080 in the address bar.
- If Jenkins is installed on a different machine, replace localhost with the IP address or hostname of that machine.
- By default, Jenkins runs on port 8080. If you've configured Jenkins to run on a different port during installation, replace 8080 with the appropriate port number.

Step -2 : Unlock Jenkins:

- When you access Jenkins for the first time, you'll be presented with a page prompting you to unlock Jenkins.
- To unlock Jenkins, you'll need to retrieve the initial administrator password from the server's filesystem. This password is typically stored in a file called initialAdminPassword.
- You can find the location of the initialAdminPassword file by running the command **sudo cat /var/lib/jenkins/secrets/initialAdminPassword.**
- Copy the password from the file and paste it into the Jenkins web interface.
- Click on "Continue" to proceed.

Step -3 : Customize Jenkins:

- Next, Jenkins will ask you to install plugins. You can either choose the suggested plugins or select the plugins you want to install.
- Generally we will click on "Install suggested plugins" to proceed.

Step -4 : Create Admin User:

- After installing plugins, Jenkins will prompt you to create an admin user.
- Fill in the required details such as username, password, full name, and email address.
- Click on "Save and Finish" to complete the setup.

Step -5 : Start Using Jenkins:

- Once the setup is complete, Jenkins will display a "Jenkins is ready!" message.
Click on "Start using Jenkins" to access the Jenkins dashboard.

Now we will have access to the Jenkins web interface where we can create and manage Jenkins jobs, configure global settings, install additional plugins, and more. From the dashboard, you can navigate to different sections of Jenkins and start configuring it according to our requirements.