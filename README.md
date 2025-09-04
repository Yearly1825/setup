Absolutely — here's the updated `README.md` with a **new "🔓 Firewall Ports" section** added to inform users about opening the required ports for WireGuard and the WG-Easy web UI.

---

````markdown
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
````

> 🔒 **Note**: This script requires `sudo` as it installs system packages and starts Docker containers.

---

## 🔓 Firewall Ports

You **must open these ports** on your instance in the AWS Lightsail or EC2 firewall settings:

| Port    | Protocol | Purpose               |
| ------- | -------- | --------------------- |
| `51820` | UDP      | WireGuard VPN         |
| `51821` | TCP      | WG-Easy Web Interface |

### 🔧 Example (Lightsail):

In your Lightsail dashboard:

1. Go to **Networking**
2. Click **Add another** under Firewall
3. Add:

   * UDP 51820
   * TCP 51821

---

## 📁 File Structure

```
.
├── install.sh          # Main installation script
├── compose.yml         # Docker Compose file used by install.sh
```

---

## 🛠 Requirements

* Ubuntu 20.04, 22.04 or similar
* Root or sudo access
* Internet access (to pull Docker images and dependencies)

---

## 📦 What's Installed

* `docker`
* `docker compose plugin`
* `curl`, `git`, `ca-certificates`
* WG-Easy (via Docker Compose)

---

## 🔐 WireGuard Access

Once installed, visit your instance’s **public IP address** in a browser:

```
https://<your-server-ip>:51821
```

Use the WG-Easy UI to manage your VPN clients easily.

---

## 🧼 Uninstallation

To stop and remove the WG-Easy stack:

```bash
cd /opt/wg-easy
sudo docker compose down
```

To uninstall Docker:

```bash
sudo apt-get remove --purge docker-ce docker-ce-cli containerd.io
```

---

## 🧾 License

MIT — Feel free to use and modify.

```

---

Let me know if you'd like to add automatic firewall rule configuration (for example, using `ufw` or AWS CLI), but typically in EC2/Lightsail, this is managed from the web console or security groups.
```
