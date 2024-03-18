Integrating Jenkins with github by using webhooks.

After successful installation and configuration of jenkins we will integrate the jenkins with git hub to build a triggers by doing this it fetch the code in the git hub repository which we have integrated and it will put for the build.

For doing that as i mentioned in the previous document we need to install necessary plugins for everything as like that for this integration we need to install the below plugins in jenkins.

- GitHub plugin: This plugin integrates Jenkins with GitHub repositories.
- GitHub Branch Source Plugin: This plugin allows Jenkins to discover branches, tags, and pull requests on GitHub repositories.
- GitHub Authentication Plugin: This plugin allows users to authenticate with Jenkins using their GitHub credentials. This is for security purppose. it can done by using the git hub credentials.

Now we need to configure webhook by following below steps :

- First of all we need to create one job in jenkins based on the project wether it is free style or pipieline or multi branch like that regarding this we will discuss in next document clearly.
- In our GitHub repository, go to "Settings" > "Webhooks" > "Add webhook".
- Set the Payload URL to http://our-jenkins-server/github-webhook/.
- Choose the content type as application/json.
- Select the events we want Jenkins to listen to (typically "Push" event).
- Ensure the webhook is active and save the configuration.
- In our Jenkins job configuration, under the "Build Triggers" section, select "GitHub hook trigger for GITScm polling".
- This tells Jenkins to trigger a build whenever it receives a webhook notification from GitHub.

This will used for whenever we make changes in the code we can make the trigger build automatically.



