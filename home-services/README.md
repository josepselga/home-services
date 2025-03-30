# 🏠 Home Dockers

A collection of Docker configurations and setups for managing home services efficiently.

## 📖 Description

This repository contains Docker Compose files and configurations to set up and manage various home services, such as media servers, home automation, and more. It is designed to simplify the deployment and management of these services using Docker.

### 📂 Directory Descriptions

- **📹 frigate/**: Contains the configuration for Frigate, an open-source NVR (Network Video Recorder) with real-time AI object detection for security cameras.
- **🏡 homeassistant/**: Contains the configuration for Home Assistant, a platform for home automation that puts local control and privacy first.
- **🎥 media/**: Contains the configuration for media-related services like Plex, Radarr, Sonarr, and Lidarr for managing and streaming media content.
- **📊 monitoring/**: Contains the configuration for monitoring tools like Netdata, Prometheus, and Grafana to monitor system and service performance.
- **🌐 networking/**: Contains the configuration for networking-related services like Pi-hole, WireGuard, and Nginx Proxy Manager for managing DNS, VPN, and reverse proxy setups.
- **📡 uisp/**: Contains the configuration for UISP (formerly UNMS), a network management system for Ubiquiti devices.
- **🛠️ utils/**: Contains the configuration for utility services like FileBrowser, OpenSpeedTest, and Dashy for file management, speed testing, and dashboarding.
- **🔐 vaultWarden/**: Contains the configuration for Vaultwarden, a lightweight Bitwarden server implementation for managing passwords and secrets.

## ✅ Prerequisites

Before using this repository, ensure you have the following installed:

- [🐳 Docker](https://docs.docker.com/get-docker/)
- [📦 Docker Compose](https://docs.docker.com/compose/install/)
- Basic knowledge of Docker and Docker Compose

## 🚀 Usage

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/home-dockers.git
   cd home-dockers
   ```

2. Copy the `defaults.env` file to `.env` on every service compose directory you want to use:
   ```bash
   cp defaults.env .env
   ```

3. Customize the `.env` file with your specific configurations. The `.env` file is used to define environment variables that Docker Compose will use.

4. Customize the Docker Compose files as needed. For example, update environment variables, volumes, or ports in the `docker-compose.yml` files.

5. Start the services:
   ```bash
   docker-compose up -d
   ```

6. Access the services via their respective URLs or ports. For example:
   - 🎥 Media server: `http://localhost:8080`
   - 🏡 Home assistant: `http://localhost:8123`

Feel free to add or remove services based on your requirements.

## 🔄 Update and Restart Services

This repository includes a helper script, `update-and-restart.sh`, to simplify the process of updating Docker images and restarting services.

### 📋 How to Use

1. Ensure the script has execution permissions:
   ```bash
   chmod +x update-and-restart.sh
   ```

2. Run the script:
   ```bash
   ./update-and-restart.sh
   ```

### 🛠️ What the Script Does

- Iterates through the selected subdirectories listed in the script.
- For each subdirectory containing a `docker-compose.yml` file:
  1. Pulls the latest Docker images for the services.
  2. Restarts the services using `docker compose up -d`.

### ⚙️ Customization

- You can modify the `SUBDIRECTORIES` array in the script to include or exclude specific services. Uncomment or comment the entries as needed:
  ```bash
  SUBDIRECTORIES=(
      #"frigate"
      "homeassistant"
      "media"
      #"monitoring"
      "networking"
      #"rustdesk"
      #"uisp"
      "utils"
      "vaultWarden"
      #"wazuh-docker"
  )
  ```

### 🚨 Notes

- Ensure that the directories listed in `SUBDIRECTORIES` exist and contain a valid `docker-compose.yml` file.
- The script skips directories that do not meet these criteria.
- Run the script from the root of the repository to ensure proper functionality.

## 🛠️ Troubleshooting

- **⚠️ Service not starting**: Check the logs using:
  ```bash
  docker-compose logs <service-name>
  ```
- **⚠️ Port conflicts**: Ensure the ports defined in `docker-compose.yml` are not already in use.
- **⚠️ Permission issues**: Verify that Docker has the necessary permissions to access the specified volumes.
- **⚠️ Environment variable issues**: Ensure the `.env` file exists and is properly configured. You can verify the variables being used by Docker Compose with:
  ```bash
  docker-compose config
  ```
