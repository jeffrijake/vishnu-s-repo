**Part -3**

How to optimize dockerfile for image size and build speed?

Method -9 : Setting appropriate metadata like which means we can use **LABEL** to add metadata, which can help with documentation and maintainability without affecting the image size.

Like In the docker file we can write as below mentioned:

	LABEL maintainer="you@example.com"
	LABEL version="1.0"
	LABEL description="This is an optimized Docker image."

Method -10 : Parallel Builds: Use Docker BuildKit for parallel builds, which can significantly speed up the build process. Like below.

	DOCKER_BUILDKIT=1 docker build .

Method -11 : Layer Caching: Push intermediate images to a registry and use them as cache sources in subsequent builds.

	docker build --cache-from myregistry/myimage:latest .

Method -12 : Incremental Builds: Structure your Dockerfile to leverage incremental builds by placing less frequently changing commands at the top and more frequently changing ones towards the bottom.

**Example Optimized Dockerfile :**

	# Use a multi-stage build to reduce the final image size
	
	# First stage: build
	FROM node:14-alpine as builder
	WORKDIR /app
	COPY package*.json ./
	RUN npm ci --only=production
	COPY . .
	
	# Second stage: minimal runtime image
	FROM node:14-alpine
	WORKDIR /app
	COPY --from=builder /app ./
	CMD ["node", "server.js"]
	
	# Clean up unnecessary files
	RUN apk --no-cache add curl && \
	    rm -rf /var/cache/apk/* /tmp/*
	
	# Use a non-root user
	RUN addgroup -S appgroup && adduser -S appuser -G appgroup
	USER appuser