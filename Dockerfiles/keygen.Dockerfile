# Base image
FROM ubuntu:20.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential autoconf automake libtool make cmake ninja-build \
    pkg-config libssl-dev zlib1g-dev git \
    && rm -rf /var/lib/apt/lists/*

# Clone the PQR-KeyCrafter repository
RUN git clone https://github.com/Syslogine-dev/PQR-KeyCrafter.git /opt/pqr-keycrafter

# Run the key generation script
WORKDIR /opt/pqr-keycrafter
RUN bash keygen.sh

# Default command
CMD ["/usr/local/bin/ssh-keygen"]
