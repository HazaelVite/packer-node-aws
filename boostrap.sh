\#!/bin/bash

set -e
sudo apt -y update
sudo apt install -y nginx
sudo systemctl start nginx
echo 'nginx instalado, sigo!'

curl -sL https://deb.nodesource.com/setup_18.x -o nodesource_setup.sh
sudo bash nodesource_setup.sh
sudo apt install -y nodejs

sudo apt install -y build-essential
echo 'Node instalado, sigo!'
cd ~

sudo npm install -y pm2@latest -g
pm2 start hello.js
#sudo env PATH=$PATH:/usr/bin /usr/lib/node_modules/pm2/bin/pm2 startup systemd -u ubuntu --hp /home/ubuntu
#pm2 startup
#sudo systemctl start pm2-ubuntu
echo 'pm2 instalado y activo'
sudo cp ~/hazaelvite /etc/nginx/sites-available/hazaelvite.com

sudo ln -s /etc/nginx/sites-available/hazaelvite.com /etc/nginx/sites-enabled/

sudo systemctl restart nginx
echo 'proxy reverse funcionando'
exit



