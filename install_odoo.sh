#!/bin/bash
# Odoo Installation Script
# (c) Sept 2023 Pandya Rahul

# Color variables
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
blue='\033[0;34m'
magenta='\033[0;35m'
cyan='\033[0;36m'
clear='\033[0m'

clear
cd

# Function to install Odoo
install_odoo() {
    echo "Installing Odoo..."
    echo "${blue} *******************************     Updating System     ******************************* ${clear}"
    sudo apt-get update
    echo "${green} *******************************    Update Success      ******************************* ${clear}\n"


    echo "${blue} *******************************     Upgrading System    ******************************* ${clear}"
    sudo apt-get -y upgrade
    echo "${green} *******************************    Upgrade Success     ******************************* ${clear}\n"


    echo "${blue} *******************************     Installing Python Dependencies  ******************************* ${clear}"
    sudo apt install git python3-pip build-essential wget python3-dev python3-venv python3-wheel libxslt-dev libzip-dev libldap2-dev libsasl2-dev python3-setuptools node-less
    pip3 install Babel decorator docutils ebaysdk feedparser gevent greenlet html2text Jinja2 lxml Mako MarkupSafe mock num2words ofxparse passlib Pillow psutil psycogreen pydot pyparsing pyserial python-dateutil python-openid pytz pyusb PyYAML qrcode reportlab requests six suds-jurko vatnumber vobject XlsxWriter xlwt xlrd
    echo "${green} *******************************    Python Dependencies Installed ******************************* ${clear}\n"


    echo "${blue} *******************************   Installing Web Dependencies ******************************* ${clear}!"
    sudo apt-get install -y npm
    sudo ln -s /usr/bin/nodejs /usr/bin/node
    sudo npm install -g less less-plugin-clean-css
    sudo apt-get install node-less
    sudo python3 -m pip install libsass 
    echo "${green} *******************************    Web Dependencies Installed  ******************************* ${clear}\n"


    echo "${blue} *******************************   Installing PostgreSQL     *******************************${clear}"
    sudo apt-get install python3-software-properties
    sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
    sudo apt-get update
    sudo apt-get -y install postgresql-12
    echo "${green} *******************************    PostgreSQL Installed    *******************************${clear}\n"


    # echo "====================== Create Database User for Odoo ======================"
    # sudo su postgres
    # cd
    # echo createuser : odoo
    # createuser -s odoo
    # echo createuser : $(whoami)
    # createuser -s $(whoami)
    # exit
    # echo  "====================== Users Created ======================\n\n"


    echo "${blue} *******************************     Creating Odoo User and Group  ******************************* ${clear}"
    sudo adduser --system --home=/opt/odoo --group odoo
    echo "${green} *******************************    Odoo User and Group Created   ******************************* ${clear}\n"


    echo "${blue} *******************************     Create Odoo Log File    ******************************* ${clear}"
    sudo apt-get update
    sudo mkdir /var/log/odoo
    sudo chown -R odoo:root /var/log/odoo
    echo "${green} *******************************    Log File Created    ******************************* ${clear}\n"


    echo "${red} *******************************    Installing psycopg2-binary  ******************************* ${clear}"
    sudo python3.8 -m pip install psycopg2-binary

    echo "${red} *******************************    Installing PyPDF2   ******************************* ${clear}"
    sudo python3.8 -m pip install PyPDF2==1.26.0

    echo "${red} *******************************    Installing Werkzeug     ******************************* ${clear}"
    sudo python3.8 -m pip install Werkzeug==0.16.1

    echo "${red} *******************************    Installing WKHTMLTOPDF     ******************************* ${clear}"
    sudo wget https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6-1/wkhtmltox_0.12.6-1.bionic_amd64.deb
    sudo dpkg -i wkhtmltox_0.12.6-1.bionic_amd64.deb
    sudo apt install -f
    sudo dpkg -i wkhtmltox_0.12.6-1.bionic_amd64.deb
    sudo cp /usr/local/bin/wkhtmltoimage  /usr/bin/wkhtmltoimage
    sudo cp /usr/local/bin/wkhtmltopdf  /usr/bin/wkhtmltopdf

    echo "${blue} *******************************     Cloning Odoo      ******************************* ${clear}"
    mkdir workspace
    cd workspace
    mkdir odoo_16
    cd odoo_16
    mkdir custom_addons_16
    git clone https://www.github.com/odoo/odoo --depth 1 --branch 16.0 --single-branch
        
}

# Function to install Requirements
install_requirements() {
    echo "Installing Requirements..."
    cd
    cd workspace
    cd odoo_16
    cd odoo

    sudo python3.8 -m pip install --upgrade --force-reinstall -r requirements.txt

    xdg-settings set default-web-browser firefox.desktop
    xdg-open http://localhost:8026

    echo "\n${yellow} *******************************   Starting Odoo       ******************************* ${clear}\n"
    python3.8 odoo-bin --addons-path=addons --xmlrpc-port=8026
}

# Main script
echo "\n${green}--------------------------- Welcome to the Odoo Installation Script --------------------------- ${clear}"
echo "\n${yellow}   Hello...${clear}!"
echo "\n${blue}   I'm Pandya Rahul (Odoo Developer)${clear}"
echo "\n${magenta}   Value my work? Fuel my motivation with a cup of coffee! ☕${clear}"
echo "\n${cyan}   https://www.buymeacoffee.com/pandyarahul${clear}\n"

echo "Please Select an option: \n"
echo "1. Install Odoo"
echo "2. Install Requirements"
echo "3. Quit \n"

read -p "Enter your choice (1/2/3): " choice

case "$choice" in
    1)
        install_odoo
        ;;
    2)
        install_requirements
        ;;
    3)
        echo "Exiting the script. Goodbye!"
        exit 0
        ;;
    *)
        echo "Invalid choice. Please select 1, 2, or 3."
        ;;
esac

exit 0

#END OF SCRIPT
