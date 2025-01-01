# PQR-Docker

This repository contains Docker configurations and scripts for deploying the PQR-Tunnel project in a containerized environment. It supports client, server, and key generation containers.

---

## Features

- **Multi-Container Setup**: Includes Docker Compose for running client, server, and keygen containers.
- **Environment Variables**: Modular `.env` files for easy configuration.
- **Automated Scripts**: Scripts for building, starting, and stopping containers.

---

## Quick Start

### 1. Clone the Repository

```bash
git clone https://github.com/<your-repo-name>/PQR-Docker.git
cd PQR-Docker
```

### 2. Build Docker Images

```bash
bash scripts/build_containers.sh
```

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

- **`docker-compose.yml`**: Defines the multi-container setup.
- **`Dockerfiles/`**: Contains individual Dockerfiles for client, server, and keygen.
- **`config/`**: Stores `.env` files for container configuration.
- **`scripts/`**: Includes scripts for managing Docker containers.

---

## Contributing

Contributions are welcome! Please fork the repository and submit a pull request.

---

## License

This project is licensed under [LICENSE_NAME]. See the `LICENSE` file for details.

