---
lang: "en"
title: "Introduction"
subtitle: "Build, Containerize and Deploy your first FOSS Service"
author:
    - \textsc{Enrique Calderon}
institute:
    - \textit{LIDSoL}
date: Semester 2026-2
---

# Welcome

## "Build, Containerize and Deploy your first FOSS Service" Workshop

- **Audience:** Programmers with basic Linux knowledge.
- **Duration:** 6 to 8 hours.
- **Goal:** Build, containerize, and deploy a standard web service on Linux with secure HTTPS access.

# Learning Objectives

1. Build a simple Flask application and containerize it using Podman.
2. Configure the minimum components of a production-ready Linux server for this service (firewall, systemd).
3. Deploy a containerized service with HTTPS using Nginx as a reverse proxy.

# The Problem, The Goal, The Solution

## Problem

Developers want to see their applications running in real conditions, but `localhost` falls short when they need to share a project or host a FOSS service.

## Goal

Developers want a simple and secure way to make their applications available through a public internet URL.

## Solution

In this workshop, participants will create, containerize, and deploy a basic Linux-hosted service with secure HTTPS access.

# Workshop Materials

- A computer with an open ssh client.
- A VPS or VM with a Linux distribution (Ubuntu, Debian, Fedora, etc.). 

# Agenda

1. Workshop Introduction
2. App Building
3. Containerization
4. Server Setup
5. Reverse Proxy & TLS
6. Final Validation & Troubleshooting

# Starting Validation

- Check your VPS/VM credentials.
- Ensure you have SSH access:
  ```bash
  ssh user@your-vps-ip
  ```
- Verify this repository is cloned locally and you have a text editor installed.
