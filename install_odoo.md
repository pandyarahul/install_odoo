
# Install Odoo

This script helps user to install Odoo on server.


## Documentation

[Documentation](https://www.getopenerp.com/install-odoo-12-on-ubuntu-18-04/)


## Step 1


Update apt source list

```bash
  sudo apt-get update
```

## Step 2
Install Updates

```bash
  sudo apt-get -y upgrade
```

## Step 3
Install Python Dependencies for Odoo

```bash
  sudo apt install git python3-pip build-essential wget python3-dev python3-venv python3-wheel libxslt-dev libzip-dev libldap2-dev libsasl2-dev python3-setuptools node-less
```

INSTALL DEPENDENCIES USING PIP3
```bash
  pip3 install Babel decorator docutils ebaysdk feedparser gevent greenlet html2text Jinja2 lxml Mako MarkupSafe mock num2words ofxparse passlib Pillow psutil psycogreen psycopg2 pydot pyparsing PyPDF2 pyserial python-dateutil python-openid pytz pyusb PyYAML qrcode reportlab requests six suds-jurko vatnumber vobject Werkzeug XlsxWriter xlwt xlrd
```

## Step 4

Odoo Web Dependencies
```bash
  sudo apt-get install -y npm
```


```bash
  sudo ln -s /usr/bin/nodejs /usr/bin/node
```


```bash
  sudo npm install -g less less-plugin-clean-css
```


```bash
  sudo apt-get install node-less
```


```bash
  sudo python3 -m pip install libsass
```

## Step 5
Install PostgreSQL 

```bash
  sudo apt-get install python3-software-properties
```


```bash
  sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
```

```bash
  wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
```

```bash
  sudo apt-get update
```

```bash
  sudo apt-get -y install postgresql-12
```

## Step 6
Create Database user for Odoo

```bash
  sudo su postgres
```

```bash
  cd
```

```bash
  createuser -s ubuntu_user_name
```

```bash
  exit
```

## Step 7

Create Odoo user and group

```bash
  sudo adduser --system --home=/opt/odoo --group odoo
```

## Step 8
Clone Odoo Branch
```bash
  git clone https://www.github.com/odoo/odoo --depth 1 --branch 16.0 --single-branch
```

## Step 9
Create Odoo Log File

```bash
  sudo apt-get update
```

```bash
  sudo chown -R odoo:root /var/log/odoo
```

## Step 10
Edit Odoo configuration file

```bash
  sudo gedit /etc/odoo.conf
```
## Step 11

Copy and paste below content in config file , write correct addons paths

```bash
[options]

; This is the password that allows database operations:

; admin_passwd = admin

db_host = False

db_port = False

db_user = odoo

db_password = False

logfile = /var/log/odoo/odoo-server.log
```

Save and Exit the file. Now run the below command on terminal to grant ownership.
```bash
  sudo chown odoo: /etc/odoo.conf
```

## Step 12

Install WKHTMLTOPDF
```bash
  sudo wget https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6-1/wkhtmltox_0.12.6-1.bionic_amd64.deb
```

```bash
  sudo dpkg -i wkhtmltox_0.12.6-1.bionic_amd64.deb
```

```bash
  sudo cp /usr/local/bin/wkhtmltoimage  /usr/bin/wkhtmltoimage
```

```bash
  sudo cp /usr/local/bin/wkhtmltopdf  /usr/bin/wkhtmltopdf
```

#### Install Missing Packages

Psycopy3-binary
```bash
  pip install psycopg2-binary
```

```bash
  sudo python3.8 -m pip install pyopenssl
```

```bash
  python3.8 -m pip install PyPDF2==1.26.0
```

```bash
  sudo python3.8 -m pip install -r requirements.txt
```

```bash
  sudo python3.8 -m pip install Werkzeug==0.16.1
```
