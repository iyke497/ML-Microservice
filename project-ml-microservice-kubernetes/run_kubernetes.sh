#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath=iyke497/ml_microservice

# Step 2
# Run the Docker Hub container with kubernetes
minikube kubectl -- run ml-app --image=iyke497/ml_microservice --port=80 

# Step 3:
# List kubernetes pods
minikube kubectl -- get pods
my_pod=$(minikube kubectl -- get pods | grep ml-app)
# Step 4:
# Forward the container port to a host
minikube kubectl -- port-forward pod/ml-app --address 0.0.0.0 8000:80
