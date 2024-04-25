What is Docker Buildkit?

Docker BuildKit is a new build engine for Docker that provides improvements in performance, parallelism, and caching for building Docker images.

Set the environment variable DOCKER_BUILDKIT=1:

	export DOCKER_BUILDKIT=1

Use the DOCKER_BUILDKIT=1 environment variable :

	DOCKER_BUILDKIT=1 docker build <build_options> <build_context>

Build Secrets: Pass secrets securely to the build process.

	docker build --secret id=mysecret,src=mysecret.txt .

Inline Caching: Improve caching by caching intermediate build outputs.

	# syntax=docker/dockerfile:experimental
	FROM alpine AS base
	RUN --mount=type=cache,target=/var/cache/apk \
	    apk add --no-cache <package>

Use the --progress=plain flag for more detailed build output :

	docker build --progress=plain .

Use BuildKit-specific build-time options for better control over build process:

	# syntax=docker/dockerfile:experimental
	FROM alpine AS builder
	RUN --mount=type=secret,id=mysecret \
	    --mount=type=cache,target=/tmp/cache \
	    apk add --update curl

What is docker container?

When we run Docker Image the container will be created along with

- One user NS get initiated
- One copy of image get attached to user NS
- One Network get attached to user Ns
- One PID get attached to user NS

What is Docker Volume?

Actually this concept was raised because of how the data persisted beyond a lifecycle of container the solution for this is Docker Volume.

Docker Volume means it is a way to attach/mount a location or directory in the container you store in a container in that directory container is done data would be persisted in that location.

What are the types of Docker volumes?

- Volume => It is located in **/var/lib/docker/volumes**
- mountfs => It is located in **Any where in the host machine**
- tempfs => It is located in **In Memory**

Practice which i have done is :

First i have list out the volumes by using the below command

	docker volume ls

Now i have created the volume by using below command

	docker volume create

The main use of this docker volumes is like if the container has deleted also we the data lost will not be there because the data which we are storing in that container will be stored in container and also in the host aswell.