Docker Networking Concept Demo.

Step -1 - I Have cretaed one AWS Ec2 linux instance and i have installed docker in it.

Step -2 - Now i have created one directory with the name "docker-networking-demo" and switched to that directory by using below commands.

	mkdir docker-networking-demo
	cd docker-networking-demo

Step -3 - Now i have creted one more directory in the above created directory with the name "web".

	mkdir web

Step -4 - Now i have created a docker file in the "web" directory.

	vi Dockerfile

Step -5 - Now i have added the below content in that "Dockerfile".

	# Use an official Node.js runtime as a parent image
	FROM node:14
	
	# Set the working directory
	WORKDIR /usr/src/app
	
	# Copy package.json and install dependencies
	COPY package*.json ./
	RUN npm install
	
	# Copy the rest of the application code
	COPY . .
	
	# Expose port 3000
	EXPOSE 3000
	
	# Run the application
	CMD ["node", "app.js"]

Step -6 - Now i have creted "package.json" in the "web" directory and i have added below content.

	{
	  "name": "web",
	  "version": "1.0.0",
	  "description": "A simple web application",
	  "main": "app.js",
	  "scripts": {
	    "start": "node app.js"
	  },
	  "dependencies": {
	    "express": "^4.17.1",
	    "mysql": "^2.18.1"
	  }
	}

Step -7 - Now i have creted "app.js" in the "web" directory and i have added below content.

	const express = require('express');
	const mysql = require('mysql');
	
	const app = express();
	const port = 3000;
	
	// Create a connection to the database
	const db = mysql.createConnection({
	  host: 'db',
	  user: 'root',
	  password: 'example',
	  database: 'testdb'
	});
	
	// Connect to the database
	db.connect((err) => {
	  if (err) {
	    throw err;
	  }
	  console.log('Connected to database');
	});
	
	app.get('/', (req, res) => {
	  res.send('Hello World!');
	});
	
	app.get('/db', (req, res) => {
	  db.query('SELECT NOW()', (err, result) => {
	    if (err) {
	      throw err;
	    }
	    res.send(result);
	  });
	});
	
	app.listen(port, () => {
	  console.log(`App running on http://localhost:${port}`);
	});

Step -8 - Now i have creted "docker-compose.yml" in the "docker-networking-demo" directory.

	vi docker-compose.yml

Step -9 - I have added the below content in the "docker-compose.yml" file.

	version: '3.8'
	
	services:
	  web:
	    build: ./web
	    ports:
	      - "3000:3000"
	    depends_on:
	      - db
	    networks:
	      - app-network
	
	  db:
	    image: mysql:5.7
	    environment:
	      MYSQL_ROOT_PASSWORD: example
	      MYSQL_DATABASE: testdb
	    networks:
	      - app-network
	
	networks:
	  app-network:

This above compose file defines two services:

- web: Builds from the web directory, exposes port 3000, and depends on the db service.
- db: Uses the official MySQL image with environment variables for the root password and database name.

Step -10 - Now i have deploy the .yaml file by using the below command.

	docker-compose up --build

Now i am facing the some issues while deploying i am working on that errors.

Note this activity done for the last 2 days which means this document related to 21-05-2024 and 22-05-2024.





	