How to create a docker image from the docker file and run through the docker container?

**Agenda :**

1) We will create a Docker file.

2) We will add instructions in docker file to create docker image.

3) We will Build (or) Run the docker file to create docker image.

4) We will run the docker image to create docker container.

5) We will access the application running in docker container.

**Prequisite :**

1) We need to have one aws ec2 linux instance.

2) We need to have docker service in that linux instance.

**Process i followed:**

Step -1 - I have installed docker service in that linux instance by follwing the below commands:

	sudo yum update -y
	
	sudo yum install docker -y
	
	sudo service docker start
	
	sudo docker --version
	
	sudo usermod -aG docker <your_username> => This command is for generally docker commands require root privileges. If you want to run Docker commands without sudo, you can add your user to the docker group.

Step -2 - I have created one directory with the name **"my app"** in the instance.

	mkdir myapp
Step -3 - I have gone to that created directory and created **.html** file with the name **index.html** and wrote **Hello World** in it.

	cd myapp
	
	echo "Hello World" > index.html
Step -4 - Now we will create a file with the name **Dockerfile** and in that we will add the instructions of to create a docker image or build a docker image.

	FROM nginx
	COPY index.html /usr/share/nginx/html
Note :-

- A Dockerfile is a text file with instructions to build a docker image.
- When we run a Dockerfile docker image will be created.
- When we runa Docker image docker containers will be created.

Step -5 - Now we will build the docker image from docker file by using below command:

	" docker build -t myapp ." => This command will build a new docker image with the tag **myapp** using the docker file in the current directory.
Step -6 - Now we will run the docker container from the docker image, by using the below command :

	" docker run -d -p 8080:80 myapp " => This tell docker to run the myapp image container and map port 8080 on your local machine to port 80 inside the container, by adding -d in the command to run that container in detach mode.
Step -7 - Now we will open a web browser and we can search with the **http://localhost:8080** to see the **Hello World** message which we written in the above **step -3** will be displayed in the webbrowser.

**Note - On 17th April 2024 and 18th April 2024 I have studied on this only so please consider this file for both 17th and 18th april. In the Next Document i will study some more indepth in the Docker.**