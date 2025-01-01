# PQR-Docker

This repository contains Docker configurations and scripts for deploying the PQR-Tunnel and PQR-KeyCrafter projects in a containerized environment. It supports client, server, and key generation containers, while maintaining modularity and independence.

---

## Features

- **Multi-Container Setup**: Includes Docker Compose for running client, server, and keygen containers.
- **Modular Independence**: Designed to work independently of PQR-Tunnel and PQR-KeyCrafter repositories, making it easier to expand or adapt to other frameworks (e.g., VMware, Kubernetes).
- **Environment Variables**: `.env` files for easy configuration of container settings.
- **Automated Scripts**: Scripts for building, starting, and stopping containers.

---

## Quick Start

### 1. Clone the Repository

```bash
git clone https://github.com/Syslogine-dev/PQR-Docker.git
cd PQR-Docker
```

### 2. Build Docker Images

```bash
bash scripts/build_containers.sh
```

This script automatically pulls the required code from:
- **PQR-Tunnel**: [https://github.com/Syslogine-dev/PQR-Tunnel](https://github.com/Syslogine-dev/PQR-Tunnel)
- **PQR-KeyCrafter**: [https://github.com/Syslogine-dev/PQR-KeyCrafter](https://github.com/Syslogine-dev/PQR-KeyCrafter)

### 3. Start the Containers

```bash
bash scripts/start_containers.sh
```

### 4. Stop and Clean Up

```bash
bash scripts/stop_containers.sh
```

---

## Folder Structure

```plaintext
PQR-Docker/
├── docker-compose.yml                # Docker Compose file for multi-container setup
├── Dockerfiles/                      # Individual Dockerfiles for each service
│   ├── client.Dockerfile
│   ├── server.Dockerfile
│   ├── keygen.Dockerfile
├── config/                           # Configuration files
│   ├── client.env
│   ├── server.env
│   ├── shared.env
├── scripts/                          # Utility scripts for container management
│   ├── build_containers.sh
│   ├── start_containers.sh
│   ├── stop_containers.sh
└── README.md                         # Documentation
```

---

## Project Dependencies

The Docker containers rely on the following projects:
- **PQR-Tunnel**: [https://github.com/Syslogine-dev/PQR-Tunnel](https://github.com/Syslogine-dev/PQR-Tunnel)  
  Provides client and server scripts for setting up quantum-safe SSH tunnels.
- **PQR-KeyCrafter**: [https://github.com/Syslogine-dev/PQR-KeyCrafter](https://github.com/Syslogine-dev/PQR-KeyCrafter)  
  Provides tools for generating quantum-safe keys.

Ensure these repositories remain updated to avoid issues during the container build process.

---

## Contributing

Contributions are welcome! Please fork the repository and submit a pull request with your improvements.

---

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.
