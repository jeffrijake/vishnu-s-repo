**Part -2**

How to optimize dockerfile for image size and build speed?

Method -4 : Use a **.dockerignore** file to exclude files and directories that are not needed in the Docker image, reducing the context size and speeding up the build process.

Example files which shown below :

	node_modules
	.git
	*.log

Method -5 : Place frequently changing instructions (like COPY and ADD) towards the bottom of the Dockerfile to maximize the use of build cache for earlier layers.

Method -6 : Minimize the dependencies which means install only the necessary dependencies and remove any that are not required for the final application.

Method -7 : Optimize package management which means for language-specific package managers, use commands that install dependencies cleanly and efficiently.

Like Use **npm ci** instead of **npm install** for clean installations.

In the docker we write like below :

	COPY package*.json ./
	RUN npm ci --only=production

Like Use a virtual environment and only install necessary packages.

In the docker we write like below :

	COPY requirements.txt .
	RUN pip install --no-cache-dir -r requirements.txt

Method -8 : Remove unnecessary files like clean up temporary files and caches to reduce the final image size.

In the docker we write like below :

	RUN apt-get clean && \
	    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 



