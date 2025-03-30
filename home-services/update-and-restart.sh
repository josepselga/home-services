#!/bin/bash

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

# Actualitzar imatges docker
for dir in "${SUBDIRECTORIES[@]}"; do
    if [ -d "$dir" ] && [ -f "$dir/docker-compose.yml" ]; then
        echo "Entering $dir and pulling Docker images..."
        (cd "$dir" && docker compose pull)
    else
        echo "Skipping $dir (not a directory or no docker-compose.yml found)"
    fi
done

# Arrancar containers actualitzats
for dir in "${SUBDIRECTORIES[@]}"; do
    if [ -d "$dir" ] && [ -f "$dir/docker-compose.yml" ]; then
        echo "Starting Docker containers in $dir..."
        (cd "$dir" && docker compose up -d)
    fi
done

echo "All selected Docker services are up and running!"

