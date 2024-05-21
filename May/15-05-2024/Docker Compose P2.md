I have practiced some of the docker compose advanced commands like :

	docker-compose exec

- The above command is used for executing a command in a running container.
- Example: docker-compose exec web bash - This will open a bash shell inside the web service container.

	    docker-compose scale

- The above command is used for setting the number of containers to run for a service.
- Example: docker-compose up --scale web=3 - This will start 3 instances of the web service.

		docker-compose config

- The above command is used for validating and viewing the Compose file.
- Example: docker-compose config - This will output the configuration in the docker-compose.yml file and highlight any errors.

		docker-compose ps

- The above command is used for listing the containers.
- Example: docker-compose ps - This will show the status of the services defined in the Compose file.

		docker-compose pull

- The above command is used for pulling the service images.
- Example: docker-compose pull - This will pull the latest versions of the images defined in the Compose file.

		docker-compose run

- The above command is used for run a one-off command.
- Example: docker-compose run web python manage.py migrate - This will run the python manage.py migrate command in the web service container.

		docker-compose stop

- The above command is used for stopping the services.
- Example: docker-compose stop - This will stop the running containers without removing them.

		docker-compose rm

- The above command is used for removing the stopped service containers.
- Example: docker-compose rm - This will remove stopped service containers.

		docker-compose restart

- The above command is used for restarting the services.
- Example: docker-compose restart - This will restart all services defined in the Compose file.

		docker-compose up -d

- The above command is used for starting the services in detached mode.
- Example: docker-compose up -d - This will start all services in the background (detached mode).

