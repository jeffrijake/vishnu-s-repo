Some more docker advanced commands which i have prepared:

docker swarm init: Initializes a new Docker Swarm on the current node and makes it a Swarm manager.

	docker swarm init

docker swarm join: Joins a node to an existing Docker Swarm as either a manager or a worker.

	docker swarm join --token <token> <manager_ip>:<manager_port>

docker node ls: Lists all nodes in the Docker Swarm along with their status and availability.

	docker node ls

docker service create: Creates a new service in the Docker Swarm.

	docker service create --name <service_name> <image_name>

docker service ls: Lists all services running in the Docker Swarm.

	docker service ls

docker service inspect: Displays detailed information about a specific service in the Docker Swarm.

	docker service inspect <service_name>

docker service scale: Scales the number of replicas for a service in the Docker Swarm.

	docker service scale <service_name>=<replica_count>

docker service update: Updates the configuration of a service in the Docker Swarm.

	docker service update --image <new_image> <service_name>

docker service rm: Removes a service from the Docker Swarm.

	docker service rm <service_name>

docker stack deploy: Deploys a new stack or updates an existing stack in the Docker Swarm from a Compose file.

	docker stack deploy -c <compose_file> <stack_name>

docker stack ls: Lists all stacks deployed in the Docker Swarm.

	docker stack ls

docker stack rm: Removes a stack and its services from the Docker Swarm.

	docker stack rm <stack_name>

To Enable Docker Content Trust globally:

	export DOCKER_CONTENT_TRUST=1

To Initialize Docker Content Trust for a repository:

	docker trust key generate <repository_name>
	docker trust sign <repository_name>:<tag>

To Enable Docker Content Trust for individual commands:

	--disable-content-trust=false

To Use Docker Security Scanning to scan Docker images for vulnerabilities:

	docker scan <image_name>

To Use seccomp profiles to restrict syscalls:

	docker run --security-opt seccomp=<profile>

To Use AppArmor or SELinux profiles to enforce access controls:

	docker run --security-opt apparmor=<profile>
	docker run --security-opt seccomp=<profile>

To Use read-only filesystems:

	docker run --read-only

To Run containers as non-root users:

	docker run --user=<username>

To Set file permissions for volumes:

	docker run -v <host_path>:<container_path>:<permissions>

To Store sensitive data securely using Docker secrets:
	
	docker secret create <secret_name> <file>
	docker secret inspect <secret_name>

To Limit container capabilities:

	docker run --cap-drop=<capability>

To Reduce attack surface by minimizing installed packages:

	docker run --rm --entrypoint="" <image_name> find / -type f

To Use Docker logging drivers to send container logs to external logging systems:

	docker run --log-driver=<driver> --log-opt=<options>




