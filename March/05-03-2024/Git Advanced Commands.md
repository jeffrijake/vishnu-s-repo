As i said in the yesterday's document Git is used to track the changes (or) commits was done on the project code. For seeing all the commits done in the project code is by giving the below command.

	git log
If we want to see the commits done in the project code with checksums then give the below command.

	git log --oneline
If we want to see the commits done in the project code with detailed checksums.

	git log --pretty=oneline
Detailed explanation of the prurppose of the git.

Step -1 : First we need to find the project releated all files and code in the local workstation folder. it is also called untracked folder.

Step -2 : Now we need to run the below command to intaialize a git in that particular untracked folder once we run this below command that untarcked folder will change to tracked folder.

	git init
Step -3 : Now we need to choose the files which will be under tracking for every change or commit and add those files in the staging area by using the below command.

	git add <file name>
Step -4 : After adding those file we want in the staging area make the necessary changes in the files according to the code and we need to save that changes and we need to use the below command to save that file permenantly for tracking.

	git commit -m "commit message"
This is the overall basic purppose or process of the git.

Now we will see some advanced commands which we used in GIT.

1) This below command is used to show the exact modifocations in the untracked files.

	git diff
2) This below command is used to show the changes in tracked files.
	
	git diff --staged
3) This below command is used to show the exact differnces in between the 2 brances.

	git diff <Branch 1> <Branch 2>
4) This below command is used to show the where and when the all commits happen previously in the whole tracked files.

	git show
5) This below command is used to show This below command is used to show the particular commit only.

	git show <checksum> 
6) This below command is used to create a branch.

	git branch <branch name>
7) This below command is used to list out the branches have in that git.

	git branch
8) This below command is used to delete any branch.

	git branch -d <branch name>
9) This below command is used to switch between the branches.

	git checkout <branch name>
10) This below command is used to switch with creating new branch.

	git checkout -b <new branch name>
11) This below command is used to reapply commits on top of another base tip.
	
	git rebase <base_branch>
12) This below command is used to join two or more development histories together.

	git merge <branch_name>