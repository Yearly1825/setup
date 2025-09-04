# 🚀 WG-Easy Auto-Installer for AWS EC2 & Lightsail

This repo provides a simple installation script to set up [WG-Easy](https://github.com/WeeJeWel/wg-easy) on Ubuntu-based **Amazon EC2 or Lightsail instances** using Docker.

## ✅ What it Does

- Installs Docker & Docker Compose
- Downloads your `docker-compose.yml` for WG-Easy
- Launches the WireGuard VPN stack
- All with a **single command**

---

## ⚡️ One-Line Install (via `curl`)

Run this command on a fresh Ubuntu instance:

```bash
curl -fsSL https://raw.githubusercontent.com/Yearly1825/setup/main/install.sh | sudo bash
