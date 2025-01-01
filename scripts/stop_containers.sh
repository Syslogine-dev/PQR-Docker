#!/usr/bin/env bash

# Stop and remove the Docker containers for the PQR-Tunnel project

# Configuration
CLIENT_CONTAINER_NAME="pqr-client"
SERVER_CONTAINER_NAME="pqr-server"
KEYGEN_CONTAINER_NAME="pqr-keygen"

# Docker network name
NETWORK_NAME="pqr-network"

# Stop the containers
echo "Stopping the server container..."
docker stop "$SERVER_CONTAINER_NAME" 2>/dev/null || echo "Server container not running."

echo "Stopping the client container..."
docker stop "$CLIENT_CONTAINER_NAME" 2>/dev/null || echo "Client container not running."

echo "Stopping the keygen container..."
docker stop "$KEYGEN_CONTAINER_NAME" 2>/dev/null || echo "Keygen container not running."

# Remove the containers
echo "Removing the server container..."
docker rm "$SERVER_CONTAINER_NAME" 2>/dev/null || echo "Server container already removed."

echo "Removing the client container..."
docker rm "$CLIENT_CONTAINER_NAME" 2>/dev/null || echo "Client container already removed."

echo "Removing the keygen container..."
docker rm "$KEYGEN_CONTAINER_NAME" 2>/dev/null || echo "Keygen container already removed."

# Optionally remove the Docker network
if docker network ls | grep -q "$NETWORK_NAME"; then
  echo "Removing the Docker network: $NETWORK_NAME"
  docker network rm "$NETWORK_NAME" 2>/dev/null || echo "Network already removed or in use."
else
  echo "Docker network $NETWORK_NAME does not exist."
fi

echo "All containers and the network have been cleaned up!"
