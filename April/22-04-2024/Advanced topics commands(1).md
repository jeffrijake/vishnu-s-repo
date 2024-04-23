Some of the advanced topics commands:

docker network ls: Lists all the networks created on the Docker host.

	docker network ls

docker network inspect: Displays detailed information about a specific network, including its configuration and connected containers.

	docker network inspect <network_name>

docker network create: Creates a new Docker network with the specified options.

	docker network create <network_name>

docker network connect: Connects a container to an existing Docker network.

	docker network connect <network_name> <container_name>

docker network disconnect: Disconnects a container from a Docker network.

	docker network disconnect <network_name> <container_name>

docker network prune: Removes all unused networks from the Docker host.

	docker network prune

docker network rm: Removes one or more Docker networks.

	docker network rm <network_name>

docker network create --driver: Allows you to specify a custom network driver when creating a network. This can be useful for integrating Docker with external networking solutions.

	docker network create --driver <driver_name> <network_name>

docker volume ls: Lists all the volumes on the Docker host.

	docker volume ls

docker volume inspect: Displays detailed information about a specific volume, including its configuration and usage.

	docker volume inspect <volume_name>

docker volume create: Creates a new Docker volume with the specified options.

	docker volume create <volume_name>

docker volume rm: Removes one or more Docker volumes.

	docker volume rm <volume_name>

docker volume prune: Removes all unused volumes from the Docker host.

	docker volume prune

docker run -v: Mounts a volume into a container at the specified path.

	docker run -v <volume_name>:<container_path> <image_name>

docker run --mount: Alternative syntax for mounting volumes into containers, providing more flexibility in specifying volume options.

	docker run --mount source=<volume_name>,target=<container_path> <image_name>

docker-compose up: Builds, (re)creates, starts, and attaches to containers for a service.

	docker-compose up

docker-compose down: Stops and removes containers, networks, and volumes created by **docker-compose up**.

	docker-compose down

docker-compose build: Builds or rebuilds services defined in the **docker-compose.yml** file.

	docker-compose build

docker-compose start: Starts services defined in the **docker-compose.yml** file.

	docker-compose start

docker-compose stop: Stops services defined in the **docker-compose.yml** file.

	docker-compose stop

docker-compose restart: Restarts services defined in the **docker-compose.yml** file.

	docker-compose restart

docker-compose ps: Lists the running containers for services defined in the **docker-compose.yml** file.

	docker-compose ps

docker-compose logs: Displays log output from services defined in the **docker-compose.yml** file.

	docker-compose logs

docker-compose exec: Executes a command in a running container.

	docker-compose exec <service_name> <command>

docker-compose down --volumes: Stops and removes containers, networks, and volumes defined in the **docker-compose.yml** file.

	docker-compose down --volumes

docker-compose config: Validates and displays the composed configuration of a project.

	docker-compose config

**Note :** Docker Compose is a tool for defining and running multi-container Docker applications. It uses YAML files to configure the application's services, networks, and volumes.

We will continue in the next document with some other advanced topics commands.