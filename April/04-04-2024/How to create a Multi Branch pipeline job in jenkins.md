How to create a multi branch pipeline job in jenkins?

To create a multi-branch pipeline job in Jenkins, we can follow the below steps:

Install Required Plugins: 

Make sure you have the Pipeline plugin installed in your Jenkins instance. This plugin enables the use of Jenkinsfile-based pipelines.

Configure Source Code Management (SCM):

- Go to your Jenkins dashboard and click on "New Item".
- Enter a name for your job and select "Multibranch Pipeline".
- Click "OK" to create the job.
- Under the "Branch Sources" section, click "Add source" and choose your version - control system (e.g., Git, SVN). But in our case we use git we will attach our repo to the jenkins by using git webhook this was exaplained in the last files.
- Configure your SCM settings like repository URL, credentials (if required), and specify which branches Jenkins should build.


Pipeline Configuration:

Jenkins will look for Jenkinsfile in each branch of your repository.
You need to have a Jenkinsfile at the root of each branch you want to build. This file defines your pipeline configuration and steps.
Jenkinsfile can be written using either Declarative Pipeline syntax or Scripted Pipeline syntax.

Define Pipeline Steps in Jenkinsfile:

- Open your code editor and create or modify the Jenkinsfile.
- Define the pipeline steps such as checkout SCM, build, test, deploy, etc., according to your project's requirements.
Commit and Push Jenkinsfile:

Commit your Jenkinsfile to the root of each branch in your repository.
Push the changes to your remote repository.
Run the Multibranch Pipeline Job:

Back in Jenkins, go to your job and click "Scan Multibranch Pipeline Now".
Jenkins will scan your repository and detect branches with Jenkinsfiles.
It will create separate pipeline jobs for each branch it finds.
View Pipeline Results:

Once the scan completes, you'll see separate pipeline jobs listed for each branch in your Jenkins dashboard.
Click on any branch to view its pipeline execution history, logs, and results.