How to configure pipeline job in jenkins?

- Open our web browser and navigate to your Jenkins instance's URL.
- Click on the "New Item" link on the Jenkins dashboard.
- Enter a name for the job we want in the "Enter an item name" field.
- Select "Pipeline" from the list of job types.
- Click "OK" to create the job.
- On the job configuration page, scroll down to the "Pipeline" section.
- Under the "Definition" dropdown, we need to select "Pipeline script from SCM" if your Jenkinsfile is stored in a source code management system (SCM) like Git.
- In other way, we can select "Pipeline script" if we want to directly write the pipeline script in the Jenkins job configuration.
- If we select SCM option Choose your SCM type (e.g., Git).
- Enter the repository URL.
- Optionally, specify the branch to build.
- Specify the script path (e.g., Jenkinsfile if it's in the root of our repository).
- If you selected "Pipeline script"
- Enter our Pipeline script directly into the "Script" text area.
- Now configure other job settings such as triggers, build environments, post-build actions, etc.
- Once we have configured your Pipeline job, click on the "Save" or "Apply" button to save our changes.
- Now we can manually trigger the Pipeline job by clicking on the "Build Now" button on the Jenkins job dashboard.
- In another we can set up triggers to automatically start the job based on events like code commits, time schedules, etc.