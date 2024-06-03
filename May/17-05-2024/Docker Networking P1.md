Docker Networking Concept.

Networking in Docker is a crucial aspect of managing containerized applications, as it enables communication between containers, with external networks, and with the host system. Here’s a breakdown of the key networking concepts in Docker, including exposing container ports, linking containers, and more:

Docker provides several types of networks to manage how containers communicate.

Network Types:

- Bridge Network: Default network driver, suitable for containers on a single host.

- Host Network: Shares the host’s network namespace, allowing containers to use the host's network directly.

- Overlay Network: Enables multi-host communication by overlaying a network over the host-specific networks. Useful for swarm services.

- Macvlan Network: Assigns a MAC address to each container, making it appear as a physical device on the network.

Creating and Using Networks:

To Create a Network use below command.

	docker network create <network_name>

To Run a Container in a Network use below command.

	docker run --network <network_name> <image_name>