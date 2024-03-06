What is remote repo?

Remote repo means repo which is maintained in cloud it is called remote repo. To host that cloud repos there are so many platforms in those git hub and git lab are most used ones.

How to create repo in git hub?

1) On the repositories page, we can see an option called "New" then click on it to create a new repository.

2) First we need to give the name to the repository we are creating.

3) Now we need to choose whether we want the repository to be public (visible to everyone) or private (visible only to you and permission given by us).

4) Initialize this repository with a README: Optionally, we can choose to create a README file for our repository.

5) Add .gitignore: Optionally, we can choose a template for our .gitignore file, which specifies which files and directories should be ignored by Git.

6) Now click on the create to create a repository in git hub.

To access this git hub repository in 2 ways either using https url or ssh url.

What is the difference between https url and ssh url while accessing the git hub repository ?

HTTPS Url : 

- when we are cloning a repo by using HTTPS Url it will ask the git hub username and password or in now a days it changed personal access token git hub has removed the password authentication so we need to create personal access token and we need to mention that when it is asks for password.
- Those who are not familiar with the SSH Keys for them it is easy to use.

SSH Url :

- When we are cloning a repo by using the SSH Url then local private key should match with the public which we stored in the git hub then only we can able to clone the repo.
- As comapared with https url it more secure and reliable.

Some more advanced commands :

1) This below command is used to push your changes from your local Git repository to a remote repository, specifically the master branch of the origin remote repository.

	git push origin master
2) This below command is used to push changes from your local repository to a remote repository.

	git push origin --all
3) This below command is used to add a remote repository to your local Git repository with the name "origin" and a specified URL. This is typically done when you want to establish a connection between your local repository and a remote repository hosted on a platform like GitHub, GitLab, etc...

	git remote add origin <https url of the repo>
4) This below command is used to fetch changes from a remote repository and integrate them into the current branch of your local repository. And also it is the combination of 2 seperate git commands : git fetch and git merge.

	git pull
5) This below command will shows the changes or commits done in remote repo and local repo.

	git fetch
6) This below command is used to integrate changes from one branch into another branch. It combines the changes made in a source branch and with the current branch.

	git merge
7) This below command is used to create a copy of a remote repository on your local machine. It downloads the entire repository, including all branches, commit history, and files, allowing you to work on the project locally.

	git clone

