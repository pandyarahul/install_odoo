#!/bin/bash

# Automated Installer Script for Odoo
# Author: Rahul Pandya

#---------------------------#
#      Basic Variables      #
#---------------------------#
ODOO_USER="odoo18"
ODOO_HOME="/home/$ODOO_USER"
ODOO_BRANCH="18.0"
ODOO_PORT="8069"
ODOO_CONFIG="$ODOO_HOME/${ODOO_USER}.conf"
ODOO_SERVICE="/etc/systemd/system/${ODOO_USER}.service"
ODOO_LOG="/var/log/odoo/${ODOO_USER}.log"
PYTHON_VERSION="3.10"
ADMIN_PASSWD="master@password"

echo "🔄 Updating system packages..."
sudo apt update && sudo apt upgrade -y

echo "🐍 Installing Python $PYTHON_VERSION and dependencies..."
sudo apt install -y software-properties-common -y
sudo add-apt-repository ppa:deadsnakes/ppa -y
sudo apt update
sudo apt install -y python${PYTHON_VERSION} python${PYTHON_VERSION}-dev python${PYTHON_VERSION}-venv \
  python${PYTHON_VERSION}-distutils python${PYTHON_VERSION}-full python${PYTHON_VERSION}-dbg

echo "📦 Installing pip for Python $PYTHON_VERSION..."
wget https://bootstrap.pypa.io/get-pip.py
sudo python${PYTHON_VERSION} get-pip.py
rm get-pip.py
sudo python${PYTHON_VERSION} -m pip install --upgrade pip setuptools wheel

echo "📚 Installing required libraries..."
sudo apt install -y libxml2-dev libxslt1-dev zlib1g-dev libsasl2-dev libldap2-dev build-essential \
  libssl-dev libffi-dev libmysqlclient-dev libjpeg-dev libpq-dev libjpeg8-dev liblcms2-dev \
  libblas-dev libatlas-base-dev git npm node-less xfonts-75dpi xfonts-base

echo "🔗 Linking node..."
sudo ln -s /usr/bin/nodejs /usr/bin/node || true
sudo npm install -g less less-plugin-clean-css

echo "👤 Creating Odoo system user..."
sudo adduser $ODOO_USER
sudo chmod 777 -R $ODOO_HOME

echo "🐘 Installing PostgreSQL and creating DB user..."
sudo apt install -y postgresql
sudo -u postgres createuser --createdb --no-createrole --no-superuser --pwprompt $ODOO_USER
sudo -u postgres psql -c "ALTER USER $ODOO_USER WITH SUPERUSER;"

echo "📂 Cloning Odoo $ODOO_BRANCH source code..."
sudo apt-get install git
cd $ODOO_HOME
sudo -u $ODOO_USER git clone https://github.com/odoo/odoo --depth 1 --branch $ODOO_BRANCH --single-branch
sudo chmod 777 -R $ODOO_HOME/odoo

echo "🖨️ Installing wkhtmltopdf..."
wget https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6-1/wkhtmltox_0.12.6-1.bionic_amd64.deb
sudo dpkg -i wkhtmltox_0.12.6-1.bionic_amd64.deb || sudo apt install -f -y
sudo cp /usr/local/bin/wkhtmltopdf /usr/bin/wkhtmltopdf
sudo cp /usr/local/bin/wkhtmltoimage /usr/bin/wkhtmltoimage
rm wkhtmltox_0.12.6-1.bionic_amd64.deb

echo "⚙️ Creating Odoo configuration file..."
cat <<EOF | sudo tee $ODOO_CONFIG > /dev/null
[options]
admin_passwd = $ADMIN_PASSWD
db_host = False
db_port = False
db_user = $ODOO_USER
db_password = False
addons_path = $ODOO_HOME/odoo/addons,$ODOO_HOME/odoo/odoo/addons
logfile = $ODOO_LOG
xmlrpc_port = $ODOO_PORT
workers = 0
proxy_mode = True
db_maxconn = 128
limit_memory_soft = 2698693120
limit_memory_hard = 31743271936
limit_request = 81960
limit_time_cpu = 6000
limit_time_real = 3600
max_cron_threads = 1
EOF

echo "📁 Creating log directory..."
sudo mkdir -p /var/log/odoo
sudo touch $ODOO_LOG
sudo chmod 777 -R /var/log/odoo

echo "📜 Creating Odoo systemd service file..."
cat <<EOF | sudo tee $ODOO_SERVICE > /dev/null
[Unit]
Description=Odoo18 Entrprise
Requires=postgresql.service
After=network.target postgresql.service

[Service]
Type=simple
SyslogIdentifier=$ODOO_USER
PermissionsStartOnly=true
User=$ODOO_USER
Group=$ODOO_USER
ExecStart=$ODOO_HOME/odoo/odoo-bin -c $ODOO_CONFIG
StandardOutput=journal+console

[Install]
WantedBy=multi-user.target
EOF

echo "🚀 Starting and enabling Odoo service..."
sudo systemctl daemon-reload
sudo systemctl enable --now $ODOO_USER
sudo systemctl start $ODOO_USER
sudo systemctl status $ODOO_USER --no-pager

echo "✅ Odoo 18 Installation Complete!"
echo "🌐 Access it at: http://your-server-ip:$ODOO_PORT"
