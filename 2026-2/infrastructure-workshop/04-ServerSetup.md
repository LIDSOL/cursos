---
lang: "en"
title: "Server Setup"
subtitle: "Build, Containerize and Deploy your first FOSS Service"
author:
    - \textsc{Enrique Calderon}
institute:
    - \textit{LIDSoL}
date: Semester 2026-2
---

# Server Setup Overview

## Goals

Attendees configure a VPS or VM with SSH hardening basics, firewall rules, Podman installation, and a systemd/quadlet service.

## Duration

90 minutes

# Connecting to the Server

Connect to your target machine using SSH.

```bash
ssh user@your.vms.ip
```

# Securing the Server: SSH Hardening

- Disable root login and password authentication (use Keys).
- Edit `/etc/ssh/sshd_config`:

```text
PermitRootLogin no
PasswordAuthentication no
```

- Restart `sshd` to apply changes.

# Firewall Rules (Firewalld)

- Allow only what you need.
- Installs`firewalld`:

```bash
sudo dnf install firewalld
sudo systemctl enable --now firewalld
```

```bash
sudo firewall-cmd --set-default-zone=public --permanent
sudo firewall-cmd --add-service=ssh --permanent
sudo firewall-cmd --add-service=http --permanent
sudo firewall-cmd --add-service=https --permanent
sudo firewall-cmd --reload
```

# Podman Installation

- Install podman on the target server.
- Example for fedora-based distros:
  ```bash
  sudo dnf update
  sudo dnf install podman
  ```
- Ensure quadlet features are supported (Podman > v4.4).

# Deploying via Systemd/Quadlet

- **Quadlet** allows writing simple systemd service files to manage Podman containers automatically.
- Let systemd define the lifecycle natively.

# Creating the Quadlet file

In your User Systemd directory (`~/.config/containers/systemd/`):

`my-flask-app.container`
```ini
[Unit]
Description=My Flask Backend App

[Container]
Image=my-flask-app:latest
PublishPort=5000:5000
EnvironmentFile=/home/user/app/.env

[Install]
WantedBy=default.target
```

# Enable with Systemd

Reload user systemctl daemon to read the Quadlet file, which auto-generates a service:

```bash
systemctl --user daemon-reload
systemctl --user start my-flask-app
```

Check the status:
```bash
systemctl --user status my-flask-app
```

# Try accessing the service from the server:

```bash
curl http://127.0.0.1:5000/ -X POST \
  -H "Content-Type: application/json" \
  -d '{"secret_key": "supersecretkey"}'
```