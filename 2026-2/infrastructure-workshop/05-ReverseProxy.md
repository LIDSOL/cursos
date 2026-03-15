---
lang: "en"
title: "Reverse Proxy and TLS"
subtitle: "Build, Containerize and Deploy your first FOSS Service"
author:
    - \textsc{Enrique Calderon}
institute:
    - \textit{LIDSoL}
date: Semester 2026-2
---

# Reverse Proxy & TLS Overview

## Goal

Attendees install and configure Nginx as a reverse proxy and enable TLS (self-signed for testing, or Let's Encrypt for public domains).

## Duration

90 minutes

# What is a Reverse Proxy?

- Acts as an intermediary for requests from clients seeking resources from servers.
- Protects the underlying service.
- Handles load balancing and TLS termination.
- Allows multiple services to share Port 80/443 mapping on the same machine.

# Installing Nginx

- Nginx will run on the host and forward traffic to the local container.

```bash
sudo dnf install nginx
sudo systemctl enable --now nginx
```

# Nginx Configuration

- Create a virtual host configuration `/etc/nginx/conf.d/my-flask-app.conf`:

```nginx
server {
    listen 80;
    server_name your.public.domain; # Use your domain or IP

    location / {
        proxy_pass http://127.0.0.1:5000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }
}
```

# Start Nginx

Enable the site snippet:
```bash
sudo nginx -t
sudo systemctl restart nginx
```

# Transport Layer Security (TLS)

- Ensures data sent to/from the service is encrypted.
- Provides authentication that the website is genuine.
- Needs Certificates (public key/private key pair).

# Self-signed vs Let's Encrypt

- Self-Signed Certificates are good for testing (Browsers will show warnings).
- Let's Encrypt provides free, automated, and open certificates using the ACME protocol.

# Getting a Let's Encrypt Certificate

Install Certbot and its Nginx plugin:
```bash
sudo dnf install certbot python3-certbot-nginx
```

Run Certbot to configure Nginx automatically:
```bash
sudo certbot --nginx -d yourdomain.com # Replace with your actual domain or IP
```

# Final Validation

- Access your service securely:
```bash
curl https://your.public.domain -X POST -H "Content-Type: application/json" -d '{"secret_key": "supersecretkey"}'
```