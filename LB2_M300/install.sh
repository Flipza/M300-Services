sudo sed -i 's/XKBLAYOUT="us"/XKBLAYOUT="ch"/g' /etc/default/locale
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install software-properties-common -y
sudo apt-add-repository ppa:ansible/ansible -y
sudo apt-get update -y
sudo apt-get install ansible -y
sudo apt-get install docker.io -y
sudo apt-get install python-pip -y
sudo apt-get install docker-compose -y
pip install docker-compose 
pip install docker 
sudo apt-get install nodejs npm -y
sudo npm install npm --global
cd /home/vagrant 
git clone https://github.com/ansible/awx.git
cd awx/installer
rm -f inventory
cp /vagrant/inventory /home/vagrant/awx/installer/
sudo ansible-playbook -i inventory install.yml
sudo apt-get install nginx -y
sudo mkdir /etc/nginx/ssl
sudo openssl req -batch -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt
sudo cp /vagrant/awx /etc/nginx/sites-available/
sudo ln -s /etc/nginx/sites-available/awx /etc/nginx/sites-enabled/
sudo nginx -t
sudo systemctl restart nginx
sudo ufw allow ssh
sudo ufw allow http
sudo ufw allow https
sudo ufw --force enable
