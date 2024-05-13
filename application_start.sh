#!/bin/bash

# Set AWS region
AWS_REGION="ap-south-1"

# Set AWS account ID
AWS_ACCOUNT_ID="633242779871"

# Set the name of your Docker image in ECR
DOCKER_IMAGE_NAME="node-app"

# Set the tag of your Docker image
DOCKER_IMAGE_TAG="latest"

# Authenticate Docker with Amazon ECR
echo "Authenticating Docker with Amazon ECR..."
aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com

# Pull the Docker image from Amazon ECR
echo "Pulling Docker image from Amazon ECR..."
docker pull $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$DOCKER_IMAGE_NAME:$DOCKER_IMAGE_TAG

# Run the Docker container
echo "Running Docker container..."
docker run -d -p 80:80 $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$DOCKER_IMAGE_NAME:$DOCKER_IMAGE_TAG

echo "Docker container started successfully."
