Advanced Docker Networking concept? - P2

**Macvlan Networks :**

Macvlan networks provide direct connectivity to the physical network. This is useful for applications that require a unique MAC address or need to be part of the physical network.

For Creting a macvlan network:

	docker network create -d macvlan \
    --subnet=192.168.1.0/24 \
    --gateway=192.168.1.1 \
    -o parent=eth0 my-macvlan-network

For connecting a container to this network:

	docker run -d --name my-container --network my-macvlan-network nginx

**Service Discovery and Load Balancing :**

In Docker Swarm, service discovery and load balancing are built-in. Swarm mode uses an internal DNS server to resolve service names to container IPs. Additionally, Swarm provides built-in load balancing, distributing traffic among containers.

**Custom DNS Configuration :**

You can customize DNS settings for Docker containers by specifying DNS servers, search domains, and options.

Example of customizing DNS settings:

	docker run -d --name my-container --dns 8.8.8.8 --dns-search example.com nginx

**IPv6 Networking :**

Docker supports IPv6, which can be enabled by configuring the Docker daemon and networks.

Enabling IPv6 in Docker daemon:

	{
	  "ipv6": true,
	  "fixed-cidr-v6": "2001:db8:1::/64"
	}

Creating a network with IPv6:

	docker network create --ipv6 --subnet "2001:db8:1::/64" my-ipv6-network


