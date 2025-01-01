# Base image
FROM ubuntu:20.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive
ENV NEW_SSH_PORT=2222

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential autoconf automake libtool make cmake ninja-build \
    pkg-config libssl-dev libkrb5-dev libz-dev libpam0g-dev libselinux1-dev git \
    && rm -rf /var/lib/apt/lists/*

# Clone the PQR-Tunnel repository
RUN git clone https://github.com/Syslogine-dev/PQR-Tunnel.git /opt/pqr-tunnel

# Run the server script
WORKDIR /opt/pqr-tunnel/server
RUN bash server.sh

# Expose the SSH port
EXPOSE $NEW_SSH_PORT

# Default command
CMD ["/usr/local/bin/sshd_oqs", "-D", "-f", "/etc/ssh/sshd_config"]
