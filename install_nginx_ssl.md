# 🚀 Odoo HTTPS Setup with Nginx and SSL Certificate

Complete guide to make your Odoo instance accessible via HTTPS with a custom domain using Nginx reverse proxy and Let's Encrypt SSL certificate.


## ✅ Goal

Transform your local Odoo installation running on:
```
http://10.20.30.40:8069/
```

Into a secure, publicly accessible service at:
```
https://yourdomain.com
```

---

## 📋 Prerequisites

Before starting, ensure you have:

### 🖥️ **Server Requirements**
- Linux server
- **Root or sudo access** to the server

### 🌐 **Network & Domain Setup**
- **Domain name** (`yourdomain.com`) properly configured
- Domain's **A record** pointing to your server's **public IP address**
- **Firewall configured** to allow traffic on ports:
  - Port 80 (HTTP)
  - Port 443 (HTTPS)
  - Port 22 (SSH - for management)

### 🔧 **Odoo Instance**
- Odoo application running on **localhost:8069** or **127.0.0.1:8069**

### ✅ **Verification Steps**
Check your setup before proceeding:

```bash
# Verify Odoo is running
curl -I http://localhost:8069

# Check if domain resolves to your server
nslookup yourdomain.com

# Verify firewall rules (Ubuntu/Debian)
sudo ufw status
```

---
