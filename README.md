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

### 2. Set Permissions for Scripts

Ensure that the scripts in the `scripts/` directory have executable permissions:

```bash
chmod +x scripts/*.sh
```

### 3. Build Docker Images

```bash
bash scripts/build_containers.sh
```

This script automatically pulls the required code from:
- **PQR-Tunnel**: [https://github.com/Syslogine-dev/PQR-Tunnel](https://github.com/Syslogine-dev/PQR-Tunnel)
- **PQR-KeyCrafter**: [https://github.com/Syslogine-dev/PQR-KeyCrafter](https://github.com/Syslogine-dev/PQR-KeyCrafter)

### 4. Start the Containers

```bash
bash scripts/start_containers.sh
```

### 5. Stop and Clean Up

```bash
bash scripts/stop_containers.sh
```

---

## Troubleshooting

### 1. Permission Denied Errors
If you encounter a `Permission Denied` error while running any script, follow these steps:

1. Grant executable permissions to the script:
   ```bash
   chmod +x scripts/<script_name>.sh
   ```

2. Re-run the script:
   ```bash
   bash scripts/<script_name>.sh
   ```

3. To grant permissions to all scripts at once:
   ```bash
   chmod +x scripts/*.sh
   ```

### 2. Docker Not Found
If you see an error indicating Docker is not installed:

1. Install Docker:
   - [Docker Installation Guide](https://docs.docker.com/get-docker/)

2. Verify the installation:
   ```bash
   docker --version
   ```

3. Ensure Docker Compose is also installed:
   ```bash
   docker-compose --version
   ```

4. Restart your terminal and retry the commands.

### 3. Unable to Connect to the Docker Daemon
If you see an error like `Cannot connect to the Docker daemon`:

1. Ensure the Docker service is running:
   ```bash
   sudo systemctl start docker
   ```

2. Add your user to the `docker` group to avoid needing `sudo`:
   ```bash
   sudo usermod -aG docker $USER
   ```

3. Log out and back in for the group changes to take effect.

4. Retry the command.

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

