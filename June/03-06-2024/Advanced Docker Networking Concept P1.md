Advanced Docker Networking Concept P1

Advanced Docker networking concepts involve understanding how Docker manages and configures network environments to support containerized applications. These concepts can help in designing and managing complex networking scenarios.

Docker supports several network drivers, each catering to different use cases:

- Bridge Network: The default network driver. Containers on the same bridge network can communicate with each other.
- Host Network: Removes network isolation between the container and the Docker host, using the host’s networking stack directly.
- Overlay Network: Enables communication between Docker services across different Docker hosts, typically used in Swarm mode.
- Macvlan Network: Assigns a MAC address to each container, making it appear as a physical device on the network.
- None Network: Disables all networking for the container.

User-defined bridge networks offer better control and more advanced features compared to the default bridge network. For example:

- Automatic DNS resolution: Containers can resolve each other by name.
- Network isolation: Containers are isolated from those on other user-defined networks unless explicitly connected.

For Creation of bridge network use the below command.

	docker network create my-bridge-network

For connecting a container to the above created bridge network use the below command.

	docker run -d --name my-container --network my-bridge-network nginx

Overlay networks are used for multi-host networking, essential for Docker Swarm mode. They allow containers running on different Docker hosts to communicate securely.

For creating an overlay network use the below command.

	docker network create -d overlay my-overlay-network

For deploying a service on the overlay network use the below command.

	docker service create --name my-service --network my-overlay-network nginx