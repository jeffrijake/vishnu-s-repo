Docker Volume Concept - Part -1

Docker volumes are a way to persist data generated by and used by Docker containers. They are used to share data between a host system and the Docker container or between different containers. Docker volumes are separate from the container's file system and have several advantages over using the container's file system directly, such as data persistence, easier backup and restore, and sharing data between containers.

**Docker Volume Concepts:**

Types of Volumes:

- Named Volumes: These volumes are created and managed by Docker. They have a specified name and can be used across multiple containers.

- Anonymous Volumes: These volumes are created by Docker but are not given a specific name. They are typically used for temporary data.

- Host Volumes: These volumes are directories or files on the host system that are mounted into a container. They allow sharing of data between the host and the container.

Volume Mounting:

- Volumes can be mounted to containers at runtime using the -v or --mount flag with the docker run command.

- You specify the source of the volume (either a named volume, an anonymous volume, or a host directory) and the target mount point within the container.

Data Persistence:

- Volumes persist even after the container is removed.

- This allows data to be retained between container restarts or even when the container is deleted and a new one is created.

**Docker Volume Commands:**

To Create Named Volume below command will be used.

	docker volume create <volume_name>

To List the volumes below command will be used.

	docker volume ls

To Inspect the volumes below command will be used.

	docker volume inspect <volume_name>

To Remove the volumes below command will be used.

	docker volume rm <volume_name>

To run container with volume below command will be used.

	docker run -v <volume_name>:/path/in/container <image_name>






