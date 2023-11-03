
# 🛠 Install [Odoo](https://www.odoo.com "Odoo's Homepage")

####  ℹ️ 𝚃𝚑𝚒𝚜 𝚜𝚌𝚛𝚒𝚙𝚝 𝚑𝚎𝚕𝚙𝚜 𝚞𝚜𝚎𝚛𝚜 𝚝𝚘 𝚎𝚊𝚜𝚒𝚕𝚢 𝚒𝚗𝚜𝚝𝚊𝚕𝚕 𝙾𝚍𝚘𝚘 𝚘𝚗 𝚜𝚎𝚛𝚟𝚎𝚛.

## Documentation

[Documentation](https://www.getopenerp.com/install-odoo-12-on-ubuntu-18-04/), If you wants to create and run Odoo with service file check this [Documentation](https://www.cybrosys.com/blog/how-to-install-odoo-16-on-ubuntu-2004-lts)


## Step 1
##### Update apt source list

```bash
sudo apt-get update
```

## Step 2
##### Install Updates

```bash
sudo apt-get -y upgrade
```

## Step 3
##### Install Python Dependencies for Odoo

```bash
sudo apt install git python3-pip build-essential wget python3-dev python3-venv python3-wheel libxslt-dev libzip-dev libldap2-dev libsasl2-dev python3-setuptools node-less
```

##### INSTALL DEPENDENCIES USING PIP3

```bash
pip3 install Babel decorator docutils ebaysdk feedparser gevent greenlet html2text Jinja2 lxml Mako MarkupSafe mock num2words ofxparse passlib Pillow psutil psycogreen pydot pyparsing pyserial python-dateutil python-openid pytz pyusb PyYAML qrcode reportlab requests six suds-jurko vatnumber vobject XlsxWriter xlwt xlrd
```

## Step 4
##### Odoo Web Dependencies

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
##### Install PostgreSQL 

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
##### Create Database user for Odoo

```bash
sudo su postgres
```

```bash
cd
```

```bash
createuser -s odoo
```

```bash
createuser -s ubuntu_user_name
```

```bash
exit
```

## Step 7
##### Create Odoo user and group

```bash
sudo adduser --system --home=/opt/odoo --group odoo
```

## Step 8
##### Clone Odoo Branch (Replace 16.0 with specific branch that you wants to clone)

```bash
git clone https://www.github.com/odoo/odoo --depth 1 --branch 16.0 --single-branch
```

## Step 9
##### Create Odoo Log File

```bash
sudo apt-get update
```

```bash
sudo mkdir /var/log/odoo
```

```bash
sudo chown -R odoo:root /var/log/odoo
```

## Step 10
##### Edit Odoo configuration file

```bash
sudo gedit /etc/odoo.conf
```

## Step 11
##### Copy and paste below content in the config file, and write the correct addons paths in needed

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

##### Save and Exit the file. Now you can run the below command on terminal to grant ownership.
```bash
sudo chown odoo: /etc/odoo.conf
```

## Step 12
##### Install WKHTMLTOPDF

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

# 🚀 Launch Odoo
```bash
http://localhost:8069
```

### Install Requirements

```bash
sudo python3.8 -m pip install -r requirements.txt
```

```bash
sudo python3.8 -m pip install --upgrade --force-reinstall -r requirements.txt
```

### Install Missing Packages

```bash
pip install psycopg2-binary
```

```bash
sudo python3.8 -m pip install pyopenssl
```

```bash
python3.8 -m pip install PyPDF2==1.26.0
```

##### Check Werkzeug Version
```bash
pip freeze | grep Werkzeug
```

```bash
sudo python3.8 -m pip install Werkzeug==0.16.1
```

##### CSS Style Error
```bash
pip3 install libsass==0.17.0
```

##### Web Module Not find
```bash
pip3 install Jinja2==2.10.1
```
```bash
pip3 install MarkupSafe==0.23
```

##### Useful Commands
```bash
sudo apt autoremove
```
```bash
sudo apt purge package_name
```
```bash
sudo dpkg --configure -a
```
```bash
pip install pip --upgrade
pip install pyopenssl --upgrade
```
## Support

For support, email hello.rahul@aol.com 😊

## Authors

- [@pandyarahul](https://github.com/pandyarahul) (𝓟𝓪𝓷𝓭𝔂𝓪 𝓡𝓪𝓱𝓾𝓵 )

[![Facebook](https://img.shields.io/badge/Facebook-%231877F2.svg?logo=Facebook&logoColor=white)](https://facebook.com/pandyarahul4u) 
[![Twitter](https://img.shields.io/badge/Twitter-%231DA1F2.svg?logo=Twitter&logoColor=white)](https://twitter.com/pandyarahul4u)
[![Instagram](https://img.shields.io/badge/Instagram-%23E4405F.svg?logo=Instagram&logoColor=white)](https://instagram.com/pandyarahul4u)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-%230077B5.svg?logo=linkedin&logoColor=white)](https://linkedin.com/in/pandyarahul) 
[![Pinterest](https://img.shields.io/badge/Pinterest-%23E60023.svg?logo=Pinterest&logoColor=white)](https://pinterest.com/pandyarahul4u) 
[![YouTube](https://img.shields.io/badge/YouTube-%23FF0000.svg?logo=YouTube&logoColor=white)](https://youtube.com/@pandyarahul) 
[![Stack Overflow](https://img.shields.io/badge/-Stackoverflow-FE7A16?logo=stack-overflow&logoColor=white)](https://stackoverflow.com/users/17455752)

[![GitHub WidgetBox](https://github-widgetbox.vercel.app/api/profile?username=pandyarahul&data=followers,repositories,stars,commits&theme=nautilus)](https://github.com/Jurredr/github-widgetbox)

<h2 align="center">Value my work? Fuel my motivation with a cup of coffee! ☕</h2>
<p align="center">
	<a align="center" href="https://www.buymeacoffee.com/pandyarahul"><img src="https://img.buymeacoffee.com/button-api/?text=Buy me a coffee&emoji=☕&slug=pandyarahul&button_colour=FF5F5F&font_colour=ffffff&font_family=Arial&outline_colour=000000&coffee_colour=FFDD00" /></a>
</p>
