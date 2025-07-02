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

## 🔁 Step-by-Step Setup

### 🔹 **Step 1: Install Fresh Nginx**

First, update your package manager and install Nginx:

```bash
sudo apt update
```

```bash
sudo apt install nginx -y
```

**Expected output:** You should see nginx installation completing without errors.

---

### 🔹 **Step 2: Start & Enable Nginx Service**

Configure Nginx to start automatically and begin running:

```bash
sudo systemctl enable nginx
```

```bash
sudo systemctl start nginx
```

**Verify the installation:**
```bash
sudo systemctl status nginx
```

You should see output showing `active (running)` in green text.

**Test basic functionality:**
Test if Nginx responds on port 80
```bash
curl -I http://localhost
```

---

### 🔹 **Step 3: Create Nginx Reverse Proxy Configuration**
