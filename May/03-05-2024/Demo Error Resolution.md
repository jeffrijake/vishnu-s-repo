Regarding Yesterday's demo the below error is coming while doing the demo :

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
	failed to solve: process "/bin/sh -c npm run build" did not complete successfully: exit code: 254

For resolving this error i got some solutions like :

There is some error in frontend code so i have done some changes in that frontend code and also the other error and resolution is like the error i am encountering indicates that the npm run build command is failing because it can't find the package.json file in the /app directory. This typically occurs when the COPY instruction in your Dockerfile doesn't copy the package.json file into the Docker image correctly.

To resolve this issue, ensure that your Dockerfile properly copies the package.json file from your project directory into the Docker image before running the npm install and npm run build commands.

And the revised frontend code which i have written is :

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

After Making the changes also still it is showing the error, Might be this time that error is as i said above as written in the frontend code **package.json** is not available in the specified location. So for resolving that i will try to nginx package in .json mode in that specified location and again i will try to deploy it again. 

I Will apply this solution on the next working day.
