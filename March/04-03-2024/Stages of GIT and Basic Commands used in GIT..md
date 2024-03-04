=> Architecture (or) Life Cycle (or) Stages of the GIT?

There are 3 basic stages in the GIT:

1) Working Directory/Untracked Files Directory

2) Staging Area

3) Local Repo/Tracking Files Directory

Stage -1: Working Directory/Untracked Files Directory: It means the current project directory which we save our live code and related files of that project is called working directory.

Satge -2: Staging Area: It means when any file want to gets start tracking or any changes made in the tracking files this staging area will come into picture by using the below commands. It is also called as Indexing Area

	git add
	git commit

Stage -3: Local Repo/Tracking Files Directory: It is a Git Repo in our local machine after giving git commit command then it will stored in the local git repo. After giving the below command the local git repo will be created with name ".git". It will store the data permenantly.

	git init
Today we will start will some basic git commads:

1) To initialize a new Git repository.

	git init
2) To clone or download a repository to a new directory.

	git clone <repository_url>
3) To add file or directory to the staging area.

	git add <file1>
4) After commit changes in the staging area to the local repo.

	git commit -m "Commit message"
5) To display the current state of the repository.

	git status
6) To push that commits to a remote repository.

	git push
