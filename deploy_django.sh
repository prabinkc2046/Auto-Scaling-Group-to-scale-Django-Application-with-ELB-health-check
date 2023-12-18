#!/bin/bash
sudo su
apt update -y
DEBIAN_FRONTEND=noninteractive apt install -y python3 python3-venv python3-pip
DEBIAN_FRONTEND=noninteractive apt install -y python3-dev default-libmysqlclient-dev build-essential pkg-config
cd $HOME
git clone https://github.com/prabinkc2046/Django-app-crm-with-mysql.git
cd Django-app-crm-with-mysql
python3 -m venv venv
source venv/bin/activate
pip install pip --upgrade pip && pip install -r requirements.txt
gunicorn dcrm.wsgi:application --bind 0.0.0.0:8000


