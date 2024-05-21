Today i have learnt about some docker compose file options.

For deploying any application by using docker compose we need to create a **docker-compose.yml** file so today i have learnt about this file options.

- In this file we can define dependencies between the services.
- For Example:

		services:
		  web:
		    build: .
		    depends_on:
		      - db
		  db:
		    image: postgres

- In this file we can define custom networks also.
- For Example:

		version: '3'
		services:
		  web:
		    image: nginx
		    networks:
		      - frontend
		      - backend
		  app:
		    image: myapp
		    networks:
		      - backend
		  db:
		    image: postgres
		    networks:
		      - backend
		
		networks:
		  frontend:
		  backend:

- In this file we can define and mount the volumes.
- For Example:

		version: '3'
		services:
		  db:
		    image: postgres
		    volumes:
		      - db-data:/var/lib/postgresql/data
		
		volumes:
		  db-data:

- In this file we can define health check for the services.
- For Example:

		version: '3.8'
		services:
		  web:
		    image: nginx
		    healthcheck:
		      test: ["CMD", "curl", "-f", "http://localhost"]
		      interval: 1m30s
		      timeout: 10s
		      retries: 3

- In this file we can define and manage sensitive data.
- For Example:

		version: '3.1'
		services:
		  web:
		    image: nginx
		    secrets:
		      - my_secret
		
		secrets:
		  my_secret:
		    file: ./secret.txt

- In this file we can define the non-sensitive data like configs also.
- For Example:

		version: '3.3'
		services:
		  web:
		    image: nginx
		    configs:
		      - my_config
		
		configs:
		  my_config:
		    file: ./my_config_file




