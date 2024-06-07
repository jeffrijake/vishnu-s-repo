What is Docker Swarm Mode?

Docker Swarm mode is a feature of Docker that allows you to create and manage a cluster of Docker nodes as a single virtual system. This provides powerful orchestration capabilities for deploying, managing, and scaling containerized applications.

- Manager Node: Responsible for managing the Swarm, including maintaining the cluster state, scheduling services, and handling API requests. There should be an odd number of manager nodes to avoid split-brain scenarios.
- Worker Node: Executes tasks assigned by manager nodes. Worker nodes do not participate in the management of the Swarm.
- A higher-level abstraction that defines how to run containers, including the number of replicas, network configuration, and update policies. A service is composed of one or more tasks.
- The atomic unit of a service. A task is a running container that is part of a service and is scheduled on a node.
- A virtual network that spans all nodes in the Swarm, enabling secure communication between containers on different nodes.
- A special overlay network that handles incoming requests to services published to a Swarm.

**Setting Up Docker Swarm :**

Step -1 : We need to intialize the Swarm for this we will use below command.

	docker swarm init --advertise-addr <manager-ip>
This command initializes a new Swarm and makes the current node the manager. we will replace <manager-ip> with the IP address of your manager node.

Step -2 : Now we need to join the worker nodes for this we will use below command.

	docker swarm join --token <worker-token> <manager-ip>:2377
The command is obtained from the output of the above **docker swarm init command**. we will replace <worker-token> and <manager-ip> with the appropriate values.

Step -3 : Now we will deploy a service with specific number of replicas by using below command.

	docker service create --name my-service --replicas 3 -p 80:80 nginx

Step -4 : If we want we can scale a service either up or down by using below command.

	docker service scale my-service=5
This command scales the my-service to 5 replicas.

Finally docker swarm mode provides a simple yet powerful way to manage a cluster of Docker nodes, making it an excellent choice for orchestrating containerized applications in a production environment.