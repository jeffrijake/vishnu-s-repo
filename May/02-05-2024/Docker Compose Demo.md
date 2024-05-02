I tried to do a demo on docker advanced topic like docker compose :

Demo :

We will Let's create an advanced Docker demo using an AWS EC2 instance. In this demo, we'll deploy a multi-container application or Dockerized web application using Docker Compose on an EC2 instance. The application will consist of a frontend built with React.js and a backend API built with Node.js and we'll use Docker Compose to manage and deploy the services.

- I have launched a aws linux ec2 instance.
- Now i have installed docker in that ec2 instance. as said in the previous documents.
- Now i have installed docker compose package in the ec2 instance by using below commands.
 
		sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

		sudo chmod +x /usr/local/bin/docker-compose

		docker-compose --version

- Now i have created a directory name **docker-demo**.
- In that i have created 2 sub-directories named **frontend** and **backend**.
- First i have written one below React.js Dockerfile in frontend directory.

		# Use official Node.js image as base
		FROM node:14 as build
		
		# Set working directory
		WORKDIR /app
		
		# Copy package.json and package-lock.json
		COPY package*.json ./
		
		# Install dependencies
		RUN npm install
		
		# Copy source code
		COPY . .
		
		# Build frontend
		RUN npm run build
		
		# Use Nginx image for serving frontend
		FROM nginx:alpine
		
		# Copy built files to Nginx public directory
		COPY --from=build /app/build /usr/share/nginx/html
		
		# Expose port 80
		EXPOSE 80
		
		# Start Nginx
		CMD ["nginx", "-g", "daemon off;"]

- Now i have written one below Node.js Dockerfile in backend directory.

		# Use official Node.js image as base
		FROM node:14
		
		# Set working directory
		WORKDIR /app
		
		# Copy package.json and package-lock.json
		COPY package*.json ./
		
		# Install dependencies
		RUN npm install
		
		# Copy source code
		COPY . .
		
		# Expose port 3000
		EXPOSE 3000
		
		# Start backend server
		CMD ["node", "server.js"]

- Now i have written a **docker-compose.yml** file in the docker-demo directory.

		version: '3.8'
		
		services:
		  frontend:
		    build: ./frontend
		    ports:
		      - "80:80"
		    depends_on:
		      - backend
		
		  backend:
		    build: ./backend
		    ports:
		      - "3000:3000"

- Now in the docker-demo directory i have run the below command to build and start the services.

		docker-compose up -d --build

But after running the above command below error is coming so i am working on it i will continue working on that error on tomorrow. This whole was done from last 2 days.

	=> ERROR [frontend build 6/6] RUN npm run build                                                                                    1.3s
	------
	 > [frontend build 6/6] RUN npm run build:
	1.150 npm ERR! code ENOENT
	1.150 npm ERR! syscall open
	1.150 npm ERR! path /app/package.json
	1.150 npm ERR! errno -2
	1.150 npm ERR! enoent ENOENT: no such file or directory, open '/app/package.json'
	1.150 npm ERR! enoent This is related to npm not being able to find a file.
	1.150 npm ERR! enoent
	1.167
	1.167 npm ERR! A complete log of this run can be found in:
	1.167 npm ERR!     /root/.npm/_logs/2024-05-02T11_29_43_480Z-debug.log
	------
	failed to solve: process "/bin/sh -c npm run build" did not complete successfully: exit code: 254.


