**How to create a Job in Jenkins?**

All the jenkins configuration files will be stored in by default is **/etc/default/jenkins**.

All the jenkins application data or home directory of the jenkins is **/var/lib/jenkins.**

Application data means like plugins which are installed and availble to install and jobs, etc,...

Whenever we make the changes in the jenkins configuration file we need to restart the jenkins service to apply that changes.

Jobs means it is an order to execute certain tasks.

**Steps to Create a Job** :

step -1 - Click on create job.

step -2 - Give a Job Name

step -3 - select the job type which we want in the below list.

- Free Style
- Pipeline
- Multi Configuration
- Folder
- Multi branch pipeline
- Organization Folder

For today we are starting with Free Style project.

step -4 - Now we need to configure the job by providing required information in the left side pannel configure section. Under configure section we have below options to fill

- General
- Source Code Management
- Build Triggers
- Build Environment
- Build Steps
- Post Build Actions

After providing all the information click on save. For running that job we need to open the job and click on **Build Now** to run that job in the left side pannel over there.

