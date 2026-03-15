---
lang: "en"
title: "Final Validation"
subtitle: "Build, Containerize and Deploy your first FOSS Service"
author:
    - \textsc{Enrique Calderon}
institute:
    - \textit{LIDSoL}
date: Semester 2026-2
---

# Final Validation Overview

## Goal

Everyone verifies that the app is reachable from another host over HTTPS and resolves common deployment issues.

## Duration

30 minutes

# Final Practical Check

By the end of the workshop, each attendee (or pair) demonstrates their deployed endpoint from an external machine:

- App responds on the expected route (HTTPS).
- Using environment variables correctly (Output varies based on `.env`).
- Firewall correctly blocking non-permitted traffic (e.g. Can't hit port 5000 directly).
- Service starts automatically on reboot (Systemd).


# Let's verify HTTPS Reachability

From a classmate's machine, or another terminal:

```bash
curl -v https://your.public.domain -X POST \
  -H "Content-Type: application/json" \
  -d '{"secret_key": "supersecretkey"}'
```

- Are you getting `HTTP/2 200`?
- Check your Nginx proxy logs if not:
  ```bash
  sudo tail -f /var/log/nginx/access.log
  ```
- Check your Flask app logs if the request is reaching it:
  ```bash
  journalctl --user -u my-flask-app -f
  ```

# Service Automation Validation

Restart your VM/VPS, and see if it automatically recovers:
```bash
sudo reboot
ssh user@your-vps-ip

sudo systemctl status nginx
systemctl --user status my-flask-app
```

# Conclusion & Next Steps

- Congratulations on deploying your first FOSS service with secure HTTPS access!
- Next steps:
    - Explore more complex apps, maybe with databases or multiple services.
    - Learn about monitoring and logging for production services.
    - Consider deploying on a cloud provider or using orchestration tools like Kubernetes for larger projects.

Thank you for participating, and happy coding!
