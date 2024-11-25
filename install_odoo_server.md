# 🛠 Install [Odoo](https://www.odoo.com "Odoo's Homepage") on Server
## Login to the Ubuntu server via SSH :

```bash
ssh -i prem_file_name.pem username@IP_Address
```

Check ubuntu version :

```bash
lsb_release -a
```

## Update Server :

```bash
sudo apt update && sudo apt upgrade
```

## Install Python 3.10 :

Prerequisite :

```bash
sudo apt update
sudo apt install software-properties-common -y
```

Add custom APT repository :

```bash
sudo add-apt-repository ppa:deadsnakes/ppa -y
sudo apt update
```

Press ENTER to confirm adding repository.

```bash
sudo apt install python3.10
python3 --version
```

Extra packages for Python 3.10 :

```bash
sudo apt install python3.10-dbg
```

```bash
 sudo apt install python3.10-dev
```

```bash
sudo apt install python3.10-venv
```

```bash
sudo apt install python3.10-distutils
```

```bash
sudo apt install python3.10-full
```

## Install PIP for Python 3.10 :

```bash
wget https://bootstrap.pypa.io/get-pip.py
```

```bash
python3 get-pip.py
```

```bash
python3 -m pip install --upgrade pip
```

```bash
pip --version
```

## Install Packages and libraries :

```bash
sudo apt-get install python-dev python3-dev libxml2-dev libxslt1-dev zlib1g-dev libsasl2-dev libldap2-dev build-essential libssl-dev libffi-dev libmysqlclient-dev libjpeg-dev libpq-dev libjpeg8-dev liblcms2-dev libblas-dev libatlas-base-dev
sudo apt-get install -y npm
sudo ln -s /usr/bin/nodejs /usr/bin/node
sudo npm install -g less less-plugin-clean-css
sudo apt-get install -y node-less
```

## Add New User for Ubuntu :

```bash
/home$ sudo adduser biodoo17
```

Give execute permissions to the user :

```bash
sudo chmod 777 -R biodoo17/
```

## Setup Database Server :

Install PostgreSQL :

```bash
sudo apt-get install postgresql
```

```bash
sudo su - postgres
```

```bash
createuser --createdb --username postgres --no-createrole --no-superuser --pwprompt odoo17
```

```bash
psql
```

```bash
ALTER USER odoo17 WITH SUPERUSER;
```

```bash
\q OR exit
```

## Clone Odoo :

```bash
sudo apt-get install git
```

```bash
cd biodoo17/

git clone https://www.github.com/odoo/odoo --depth 1 --branch 17.0 --single-branch
```

Give execute permissions to Odoo :

```bash
sudo chmod 777 -R odoo/
```

Run Requirement of Odoo:

```bash
/home/biodoo17$ cd odoo/
/home/biodoo17/odoo$ sudo python3.10 -m pip install -r requirements.txt
```

## Install WKHTMLTOPDF

```bash
sudo wget https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6-1/wkhtmltox_0.12.6-1.bionic_amd64.deb
```

```bash
sudo dpkg -i wkhtmltox_0.12.6-1.bionic_amd64.deb
```

```bash
sudo apt install -f
```

```bash
sudo cp /usr/local/bin/wkhtmltoimage  /usr/bin/wkhtmltoimage
```

```bash
sudo cp /usr/local/bin/wkhtmltopdf  /usr/bin/wkhtmltopdf
```
##### If getting issue with wkhtmltopdf
```bash
sudo apt-get --assume-yes install xfonts-75dpi xfonts-base
```

```bash
sudo -i
```

```bash
wget http://archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1f-1ubuntu2_amd64.deb
```
```bash
sudo dpkg -i libssl1.1_1.1.1f-1ubuntu2_amd64.deb
```

## Create Config File :

```bash
/home/biodoo17$ sudo vim odoo17.conf
```

Paste below content intto file :

```bash
[options]
; This is the password that allows database operations:

admin_passwd= bi@master@909
db_host = False
db_name = False
db_port = False
db_user = odoo18
db_password = False
addons_path = /home/odoo18/odoo/addons,/home/odoo18/odoo/odoo/addons,/home/odoo18/enterprise/
workers= 0
proxy_mode = True
db_maxconn = 128
limit_memory_soft = 2698693120
limit_memory_hard = 31743271936
limit_request = 81960
limit_time_cpu = 6000
limit_time_real = 3600
max_cron_threads = 1
xmlrpc_port = 8069
logfile = /var/log/odoo/odoo18.log
```

Create a Log file for Odoo :

```bash
sudo mkdir -p /var/log/odoo/
```

```bash
sudo chmod 777 -R /var/log/odoo/

```

```bash
/home/biodoo17/odoo$ python3.10 ./odoo-bin -c ../odoo17.conf

```

## Create Service File :

```bash
/home$ sudo vim /etc/systemd/system/biodoo17.service
```

Paste the below content into service file :

```bash
[Unit]
Description=Odoo18
Requires=postgresql.service
After=network.target postgresql.service

[Service]
Type=simple
SyslogIdentifier=odoo18
PermissionsStartOnly=true
User=odoo18
Group=odoo18
ExecStart=/home/odoo18/odoo/odoo-bin -c /home/odoo18/odoo18.conf
StandardOutput=journal+console

[Install]
WantedBy=multi-user.target
```

## Start Stop Service :

Enable Odoo Service :

```bash
sudo systemctl enable --now biodoo17
```

Reload services :

```bash
sudo systemctl daemon-reload
```

Start Odoo Service :

```bash
sudo systemctl start biodoo17
```

Stop Odoo Service :

```bash
sudo systemctl stop biodoo17
```

Restart Odoo Service :

```bash
sudo systemctl restart biodoo17
```

Check Status of Service :

```bash
sudo systemctl status biodoo17
```

Update and upgrade pip

```bash
pip install --upgrade setuptools
```

```bash
pip install -U setuptools
```

```bash
pip install --upgrade --force-reinstall setuptools
```

Add module on server
```bash
sudo rsync -Paz --rsh "ssh -i bhaktivedanta_odoo17.pem" /home/rahul/Downloads/bma_addons ubuntu@35.154.10.30:/home/biodoo17/custom_addons

cp -i /home/biodoo17/custom_addons/bma_addons/ /home/biodoo17/custom_addons/
```

## Documentation

[Documentation](https://www.cybrosys.com/blog/how-to-install-odoo-17-on-ubuntu-20-04-lts-server)

[Documentation](https://linuxcapable.com/how-to-install-python-3-10-on-ubuntu-linux/)

## Authors

- [@pandyarahul](https://www.github.com/pandyarahul)
