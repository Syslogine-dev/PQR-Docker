#!/usr/bin/env bash

# Start the Docker containers for the PQR-Tunnel project

# Configuration
CLIENT_CONTAINER_NAME="pqr-client"
SERVER_CONTAINER_NAME="pqr-server"
KEYGEN_CONTAINER_NAME="pqr-keygen"

CLIENT_IMAGE="pqr-client"
SERVER_IMAGE="pqr-server"
KEYGEN_IMAGE="pqr-keygen"

# Docker network name
NETWORK_NAME="pqr-network"

# Create a Docker network if it doesn't exist
if ! docker network ls | grep -q "$NETWORK_NAME"; then
  echo "Creating Docker network: $NETWORK_NAME"
  docker network create "$NETWORK_NAME"
else
  echo "Docker network $NETWORK_NAME already exists."
fi

# Start the server container
echo "Starting the server container..."
docker run -d --name "$SERVER_CONTAINER_NAME" --network "$NETWORK_NAME" \
  -p 2222:2222 "$SERVER_IMAGE"
if [[ $? -ne 0 ]]; then
  echo "Error: Failed to start the server container."
  exit 1
fi

# Start the client container
echo "Starting the client container..."
docker run -d --name "$CLIENT_CONTAINER_NAME" --network "$NETWORK_NAME" \
  "$CLIENT_IMAGE"
if [[ $? -ne 0 ]]; then
  echo "Error: Failed to start the client container."
  exit 1
fi

# Start the keygen container
echo "Starting the key generation container..."
docker run -d --name "$KEYGEN_CONTAINER_NAME" --network "$NETWORK_NAME" \
  "$KEYGEN_IMAGE"
if [[ $? -ne 0 ]]; then
  echo "Error: Failed to start the key generation container."
  exit 1
fi

echo "All containers have been successfully started!"
docker ps
