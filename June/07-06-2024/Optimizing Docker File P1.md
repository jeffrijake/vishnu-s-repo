**Part -1**

How to optimize dockerfile for image size and build speed?

Optimizing a Dockerfile for both image size and build speed can significantly improve the efficiency and performance of your containerized applications. Here are some strategies to achieve these optimizations:

Method -1 : Choosing a minimal base image like **alpine** which is a small, security-oriented Linux distribution. However, ensure compatibility with your application requirements.

In the Dockerfile we will mention this like below:

	FROM alpine:latest

Method -2 : Multi-stage builds allow you to separate the build environment from the runtime environment, reducing the final image size by including only the necessary artifacts.

In the Dockerfile we will mention this like below:

	# First stage: build
	FROM golang:1.16-alpine as builder
	WORKDIR /app
	COPY . .
	RUN go build -o myapp
	
	# Second stage: minimal runtime image
	FROM alpine:latest
	WORKDIR /app
	COPY --from=builder /app/myapp .
	CMD ["./myapp"]

Method -3 : Reduce the Number of Layers by each **RUN, COPY, and ADD** instruction creates a new layer. Combine commands to reduce the number of layers.

In the Dockerfile we will mention this like below:

	RUN apt-get update && apt-get install -y \
	    package1 \
	    package2 \
	 && apt-get clean && rm -rf /var/lib/apt/lists/*
