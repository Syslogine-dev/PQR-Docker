# Base image
FROM ubuntu:20.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential autoconf automake libtool make cmake ninja-build \
    pkg-config libssl-dev zlib1g-dev git libc6-dev \
    && rm -rf /var/lib/apt/lists/*

# Clone PQR-Tunnel repository
RUN git clone https://github.com/Syslogine-dev/PQR-Tunnel.git /opt/pqr-tunnel

# Run the client script
WORKDIR /opt/pqr-tunnel/client
RUN bash client.sh

# Default command
CMD ["/bin/bash"]
