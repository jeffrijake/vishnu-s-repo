Some of the Docker Commands in general we use?

- docker run <image name>: This command runs a Docker container based on the specified image.
- docker pull <image name>: Downloads a Docker image from Docker Hub or another registry.
- docker build <path to Dockerfile>: Builds a Docker image from a Dockerfile.
- docker ps: Lists all running containers.
- docker images: Lists all locally available Docker images.
- docker stop <container name>: Stops a running container.
- docker start <container name>: Starts a stopped container.
- docker rm <container name>: Removes a container.
- docker rmi <image name>: Removes a Docker image.
- docker exec -it <container name> <command>: Executes a command inside a running container.
- docker-compose up: Builds, (re)creates, starts, and attaches to containers for a service defined in a docker-compose.yml file.
- docker-compose down: Stops and removes containers, networks, and volumes created by docker-compose up.
- docker network ls: Lists all Docker networks.
- docker volume ls: Lists all Docker volumes.
- docker inspect <object>: Returns low-level information about Docker objects (containers, images, volumes, networks).
- docker logs <container name>: Fetches the logs of a container.
- docker commit <container name> <image name>: Creates a new image based on changes made to a container.
- docker save <image name> > image.tar: Saves one or more images to a tar archive file.
- docker load < image.tar: Loads an image from a tar archive file.
- docker system prune: Removes all stopped containers, dangling images, and unused networks and volumes.

These above commands will cover basic container management, image handling, network and volume operations, and more advanced tasks like using Docker Compose and inspecting Docker objects.

In the next document we will focus on how to create a docker image and docker container.