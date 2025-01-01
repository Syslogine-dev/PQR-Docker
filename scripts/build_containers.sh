#!/usr/bin/env bash

# Build the Docker images for the PQR-Tunnel project

# Configuration
CLIENT_IMAGE="pqr-client"
SERVER_IMAGE="pqr-server"
KEYGEN_IMAGE="pqr-keygen"

# Build the client container
echo "Building the client container..."
docker build -t "$CLIENT_IMAGE" -f Dockerfiles/client.Dockerfile .
if [[ $? -ne 0 ]]; then
  echo "Error: Failed to build the client container."
  exit 1
fi

# Build the server container
echo "Building the server container..."
docker build -t "$SERVER_IMAGE" -f Dockerfiles/server.Dockerfile .
if [[ $? -ne 0 ]]; then
  echo "Error: Failed to build the server container."
  exit 1
fi

# Build the keygen container
echo "Building the key generation container..."
docker build -t "$KEYGEN_IMAGE" -f Dockerfiles/keygen.Dockerfile .
if [[ $? -ne 0 ]]; then
  echo "Error: Failed to build the keygen container."
  exit 1
fi

echo "All containers have been successfully built!"
