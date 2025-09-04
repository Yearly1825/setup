#!/bin/bash

# Exit script if any command fails
set -e

# Ensure running as root
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root!" 1>&2
    exit 1
fi

# Update and install prerequisites
echo "Updating package list and installing prerequisites..."
sudo apt-get update
sudo apt-get install -y ca-certificates curl git

# Install Docker if not already installed
if ! command -v docker &> /dev/null; then
    echo "Docker not found. Installing Docker..."
    sudo install -m 0755 -d /etc/apt/keyrings
    sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc

    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
    $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
else
    echo "Docker is already installed."
fi

# Clone the WG-Easy repo
echo "Cloning WG-Easy repository..."
WG_EASY_PATH="/opt/wg-easy"
sudo mkdir -p "$WG_EASY_PATH"
sudo git clone https://github.com/Yearly1825/setup.git "$WG_EASY_PATH"

# Start Docker Compose
echo "Starting Docker Compose for WG-Easy..."
sudo docker compose -f "$WG_EASY_PATH/compose.yml" up -d

echo "WG-Easy setup complete!"
