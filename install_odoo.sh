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
    echo "\nChoose an Odoo Version to Install:"
    echo "${green}1. Odoo 16.0 ${clear}"
    echo "${yellow}2. Odoo 17.0 ${clear}\n"

    read -p "Enter your choice (1/2): " version_choice

    case $version_choice in
        1)
            echo "\nYou chose to Install Odoo 16.0 \n"
            install_odoo_16
            ;;
        2)
            echo "\nYou chose to Install Odoo 17.0 \n"
            install_odoo_17
            ;;
        *)
            echo "Invalid choice. Installation aborted."
            ;;
    esac
    exit 0
}

# Function to install Odoo
install_odoo_16() {
    echo "Installing Odoo..."
    echo "${blue} *******************************     Updating System     ******************************* ${clear}"
    sudo apt-get update
    echo "${green} *******************************    Update Success      ******************************* ${clear}\n"


    echo "${blue} *******************************     Upgrading System    ******************************* ${clear}"
    sudo apt-get upgrade -y
    echo "${green} *******************************    Upgrade Success     ******************************* ${clear}\n"


    echo "${blue} *******************************     Installing Python Dependencies  ******************************* ${clear}"
    sudo apt install git python3-pip build-essential wget python3-dev python3-venv python3-wheel libxslt-dev libzip-dev libldap2-dev libsasl2-dev python3-setuptools node-less
    pip3 install Babel decorator docutils ebaysdk feedparser gevent greenlet html2text Jinja2 lxml Mako MarkupSafe mock num2words ofxparse passlib Pillow psutil psycogreen pydot pyparsing pyserial python-dateutil python-openid pytz pyusb PyYAML qrcode reportlab requests six suds-jurko vatnumber vobject XlsxWriter xlwt xlrd
    sudo pip3 install setuptools
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

    echo "${blue} *******************************     Create Database User for Odoo     ******************************* ${clear}"
    # Prompt for PostgreSQL password
    read -p "Enter Password for PostgreSQL User: " password
    echo

    # Check if the password is not empty
    if [ -z "$password" ]; then
        echo "Error: Password cannot be empty."
        exit 1
    fi

    # Create PostgreSQL user
    sudo -u postgres psql -c "CREATE ROLE $(whoami) WITH SUPERUSER LOGIN CREATEDB CREATEROLE PASSWORD '$password';"

    echo "PostgreSQL user '$(whoami)' has been successfully created."
    # sudo su postgres
    # cd
    # echo createuser : odoo
    # createuser -s odoo
    # echo createuser : $(whoami)
    # createuser -s $(whoami)
    # exit


    echo "${blue} *******************************     Creating Odoo User and Group  ******************************* ${clear}"
    sudo adduser --system --home=/opt/odoo --group odoo
    echo "${green} *******************************    Odoo User and Group Created   ******************************* ${clear}\n"


    echo "${blue} *******************************     Create Odoo Log File    ******************************* ${clear}"
    sudo apt-get update
    sudo mkdir /var/log/odoo
    sudo chown -R odoo:root /var/log/odoo
    echo "${green} *******************************    Log File Created    ******************************* ${clear}\n"

    echo "${blue} *******************************     Cloning Odoo      ******************************* ${clear}"
    mkdir workspace
    cd workspace
    mkdir odoo_16
    cd odoo_16
    mkdir custom_addons_16
    git clone https://www.github.com/odoo/odoo --depth 1 --branch 16.0 --single-branch
    echo "\n\n Odoo has been successfully installed"
    echo "\n Find Odoo at /Desktop/workspace"
}

# Function to install Odoo
install_odoo_17() {
    echo "${blue} *******************************     Updating System     ******************************* ${clear}"
    sudo apt update && sudo apt upgrade -y
    
    echo "${green} *******************************    Installing Python3.10      ******************************* ${clear}\n"
    sudo apt install software-properties-common -y
    sudo add-apt-repository ppa:deadsnakes/ppa
    sudo apt install python3.10
    sudo apt update

    echo "${blue} *******************************     Cloning Odoo      ******************************* ${clear}"
    sudo apt-get install git
    mkdir workspace
    cd workspace
    mkdir odoo_17
    cd odoo_17
    mkdir custom_addons_17
    git clone https://www.github.com/odoo/odoo --depth 1 --branch 17.0 --single-branch
    echo "\n\n Odoo has been successfully installed"
    echo "\n Find Odoo at /Desktop/workspace"
}


# Function to install Requirements
install_requirements() {
    echo "\n Choose a Version to Install Requirements"
    echo "${green}1. Odoo 16.0 ${clear}"
    echo "${yellow}2. Odoo 17.0 ${clear}\n"

    read -p "Enter your choice (1/2): " version_choice

    case $version_choice in
        1)
            echo "\nYou chose to Install Requirements for Odoo 16.0 \n"
            install_requirements_16
            ;;
        2)
            echo "\nYou chose to Install Requirements for Odoo 17.0 \n"
            install_requirements_17
            ;;
        *)
            echo "Invalid choice. Installation aborted."
            ;;
    esac
    exit 0
}

# Function to install Requirements for Odoo 16
install_requirements_16() {
    echo "Installing Requirements..."
    cd
    cd workspace
    cd odoo_16
    cd odoo

    echo "${green} *******************************    Installing psycopg2-binary  ******************************* ${clear}"
    sudo python3.8 -m pip install psycopg2-binary
    echo "${green} *******************************    Installing PyPDF2   ******************************* ${clear}"
    sudo python3.8 -m pip install PyPDF2==1.26.0
    echo "${green} *******************************    Installing Werkzeug     ******************************* ${clear}"
    sudo python3.8 -m pip install Werkzeug==0.16.1
    
    echo "${green} *******************************    Installing WKHTMLTOPDF     ******************************* ${clear}"
    sudo wget https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6-1/wkhtmltox_0.12.6-1.bionic_amd64.deb
    sudo dpkg -i wkhtmltox_0.12.6-1.bionic_amd64.deb
    sudo apt install -f
    sudo dpkg -i wkhtmltox_0.12.6-1.bionic_amd64.deb
    sudo cp /usr/local/bin/wkhtmltoimage  /usr/bin/wkhtmltoimage
    sudo cp /usr/local/bin/wkhtmltopdf  /usr/bin/wkhtmltopdf

    sudo python3.8 -m pip install --upgrade --force-reinstall -r requirements.txt

    xdg-settings set default-web-browser firefox.desktop
    xdg-open http://localhost:8026
    echo "\n\n Odoo has been successfully installed and started. Access it at http://localhost:8026"
    echo "\n${yellow} *******************************   Starting Odoo       ******************************* ${clear}\n"
    python3.8 odoo-bin --addons-path=addons --xmlrpc-port=8026
}

# Function to install Requirements for Odoo 17
install_requirements_17() {
    echo "Installing Requirements..."
    sudo apt autoremove
    sudo apt install python3.10-distutils

    sudo snap install curl
    curl -sS https://bootstrap.pypa.io/get-pip.py | python3.10
    curl -sS https://bootstrap.pypa.io/get-pip.py | sudo python3.10

    curl -sS https://bootstrap.pypa.io/get-pip.py | python3
    curl -sS https://bootstrap.pypa.io/get-pip.py | sudo python3
    
    echo "${green} *******************************    Installing psycopg2-binary  ******************************* ${clear}"
    sudo python3.10 -m pip install psycopg2-binary
    echo "${green} *******************************    Installing PyPDF2   ******************************* ${clear}"
    sudo python3.10 -m pip install PyPDF2==2.12.1
    echo "${green} *******************************    Installing Werkzeug     ******************************* ${clear}"
    sudo python3.10 -m pip install Werkzeug==2.0.2

    cd
    cd workspace
    cd odoo_17
    cd odoo
    sudo python3.10 -m pip install --upgrade --force-reinstall -r requirements.txt

    xdg-settings set default-web-browser firefox.desktop
    xdg-open http://localhost:8027
    echo "\n\n Odoo has been successfully installed and started. Access it at http://localhost:8027"
    echo "\n${yellow} *******************************   Starting Odoo       ******************************* ${clear}\n"
    python3.10 odoo-bin --addons-path=addons --xmlrpc-port=8027
}


# Main script
while true; do
	echo "\n${green}--------------------------- Welcome to the Odoo Installation Script --------------------------- ${clear}"
	echo "\n${yellow}   Hello...${clear}!"
	echo "\n${blue}   I'm Pandya Rahul (Odoo Developer)${clear}"
	echo "\n${magenta}   Value my work? Fuel my motivation with a cup of coffee! ☕${clear}"
	echo "\n${cyan}   https://www.buymeacoffee.com/pandyarahul${clear}\n"

	echo "Please Select an option: \n"
	echo "${green}1. Install Odoo ${clear}"
	echo "${yellow}2. Install Requirements ${clear}"
	echo "${red}3. Quit ${clear}\n"

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
done
exit 0

#END OF SCRIPT
