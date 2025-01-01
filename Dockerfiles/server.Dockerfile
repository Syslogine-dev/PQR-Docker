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

# Set up directories
WORKDIR /opt/oqs-ssh

# Clone and build liboqs
RUN git clone https://github.com/open-quantum-safe/liboqs.git /opt/liboqs \
    && cd /opt/liboqs \
    && mkdir build && cd build \
    && cmake -GNinja -DCMAKE_INSTALL_PREFIX=/usr/local .. \
    && ninja && ninja install

# Clone and build OQS-SSH
RUN git clone https://github.com/open-quantum-safe/openssh-portable.git /opt/oqs-ssh \
    && cd /opt/oqs-ssh \
    && autoreconf -i \
    && CPPFLAGS="-I/usr/local/include" LDFLAGS="-L/usr/local/lib" \
       ./configure --prefix=/usr/local --with-libs=-loqs \
    && make -j$(nproc) \
    && make install

# Copy sshd configuration template
COPY config/sshd_config_template /etc/ssh/sshd_config

# Create necessary directories
RUN mkdir -p /var/empty /etc/ssh/quantum_keys \
    && chmod 755 /var/empty /etc/ssh/quantum_keys

# Generate quantum-safe Falcon512 host key
RUN ssh-keygen -t ssh-falcon512 -f /etc/ssh/quantum_keys/ssh_host_falcon512_key -N "" -q \
    && chmod 600 /etc/ssh/quantum_keys/ssh_host_falcon512_key \
    && chmod 644 /etc/ssh/quantum_keys/ssh_host_falcon512_key.pub

# Expose the SSH port
EXPOSE $NEW_SSH_PORT

# Start the SSH server
CMD ["/usr/local/bin/sshd_oqs", "-D", "-f", "/etc/ssh/sshd_config"]
