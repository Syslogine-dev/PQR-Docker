# Base image
FROM ubuntu:20.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential autoconf automake libtool make cmake ninja-build \
    pkg-config libssl-dev zlib1g-dev git \
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

# Default command
CMD ["/bin/bash"]
