Docker Networking Concept.

Exposing Container Ports :

When you run a Docker container, you often need to make its services accessible outside the container. This is done by exposing the container’s ports.

Exposing Ports :

	docker run -p <host_port>:<container_port> <image_name>

- Example: docker run -p 8080:80 nginx

This command maps port 80 of the container (where Nginx listens by default) to port 8080 on the host machine.

Linking Containers (Deprecated) :

Linking was an older way to allow containers to communicate, and it's now deprecated in favor of user-defined networks.

	docker run --link <container_name_or_id>:<alias> <image_name>

- Example: If you have a database container named db, you could link another container to it:

	docker run --link db:db_alias my_app

DNS-Based Service Discovery :

- With user-defined networks, Docker containers can communicate using container names as DNS names.
-  For Example If two containers web and db are in the same user-defined network, web can reach db simply by using the hostname db.

Inspecting Networks :

We can inspect network configurations and see which containers are connected to which networks.

Commands:

- To List the Networks use below command.
	
		docker network ls

- To Inspect the Network use below command.

		docker network inspect <network_name

Finally by understanding and utilizing these Docker networking concepts, you can efficiently manage and scale your containerized applications, ensuring proper communication between different services and external clients.
