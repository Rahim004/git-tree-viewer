mkdir -p ~/joomla-mysql-project
cd ~/joomla-mysql-project
mkdir -p {backups,logs,extensions,templates}
nano docker-compose.yml
nano install.sh
mkdir -p backups logs extensions templates
docker-compose up -d 2>/dev/null || docker compose up -d
lsb_release -a
sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get update
sudo apt-get install     ca-certificates     curl     gnupg     lsb-release -y
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
curl -fsSL https://download.docker.com/linux/ubuntu/gpg
echo   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable"
sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
echo   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y
docker --version
sudo docker run hello-world
sudo apt-get update
sudo docker run hello-world
docker compose version
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y
docker --version
sudo docker run hello-world
lsb_release -a
sudo apt update
sudo apt upgrade -y
sudo docker run hello-world
sudo apt install -y     apt-transport-https     ca-certificates     curl     gnupg     lsb-release     software-properties-common
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
sudo docker run hello-world
sudo usermod -aG docker $USER
newgrp docker
docker ps
cd ~
mkdir drupal-project
cd drupal-project
mkdir -p {config/nginx/conf.d,config/drupal,modules,themes,backups,ssl}
ls -la
nano docker-compose.yml
cd ~/drupal-project/config/nginx/conf.d
nano drupal.conf
cd ~/drupal-project
cd ~/drupal-project/config/drupal
nano settings.php
cd ~/drupal-project
ls -la
cat docker-compose.yml | head -20
tree
docker compose up -d
docker ps
docker compose logs
docker volume ls
docker compose exec postgres pg_isready -U drupaluser
curl -I http://localhost
curl -I http://localhost:8080
docker compose stop
docker volume ls | grep drupal-project
docker compose start
cd ~/drupal-project
nano config/drupal/settings.php
docker compose restart drupal
docker compose ps
sudo apt update
sudo apt upgrade -y
sudo apt install -y     apt-transport-https     ca-certificates     curl     gnupg     lsb-release     software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo   "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io
sudo docker --version
sudo apt upgrade -y
sudo apt install -y     apt-transport-https     ca-certificates     curl     gnupg     lsb-release     software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo   "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io
sudo docker run hello-world
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version
sudo usermod -aG docker $USER
newgrp docker
docker run hello-world
cd ~
mkdir joomla-project
cd joomla-project
pwd
nano docker-compose.yml
docker-compose up -d
nano docker-compose.yml
docker-compose up -d
docker ps
docker volume ls
docker-compose down~
cat docker-compose.yml | grep -A5 -B5 "environment"
cd ~/joomla-project
rm docker-compose.yml
nano docker-compose.yml
mkdir -p mysql-init
nano mysql-init/01-create-user.sql
chmod 644 mysql-init/01-create-user.sql
docker-compose down
docker volume rm -f $(docker volume ls -q | grep joomla-project) 2>/dev/null || true
docker volume rm joomla-project_mysql-data joomla-project_joomla-data 2>/dev/null || true
docker-compose up -d
cd ~/joomla-project
docker-compose down
docker-compose up -d
docker rm -f joomla-mysql
docker rm -f $(docker ps -aq --filter "name=joomla")
cd ~/joomla-project
docker-compose up -d
docker ps -a
docker-compose down
docker ps -a
cd ~/joomla-project
cp docker-compose.yml docker-compose.yml.backup
nano docker-compose.yml
docker-compose up -d
cd ~
rm -rf joomla-project
mkdir joomla-fix
cd joomla-fix
docker-compose up -d
cd ~/joomla-project~
md ~/joomla-project~
[200~nano fresh-start.sh~
nano fresh-start.sh~
docker --version
sudo apt update
sudo apt install -y     apt-transport-https     ca-certificates     curl     gnupg     lsb-release     software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo   "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io
sudo docker --version
sudo docker run hello-world
sudo usermod -aG docker $USER
sudo reboot
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version
cd ~
mkdir joomla-site
cd joomla-site
pwd
nano docker-compose.yml
docker-compose up -d
docker-compose ps
nano start.sh
nano stop.sh
nano restart.sh[C
nano restart.sh
chmod +x start.sh
chmod +x stop.sh
chmod +x restart.sh
./start.sh
nano start.sh
./start.sh
docker-compose logs mysql
sleep 60
docker rm -f $(docker ps -aq) 2>/dev/null || true
docker volume rm $(docker volume ls -q) 2>/dev/null || true
cd ~
mkdir joomla-final
cd joomla-final
nano docker-compose.yml
docker-compose up -d
docker-compose ps
mkdir drupal-postgres-nginx
mkdir drupal-postgres-ngin
cd drupal-postgres-ngin
docker-compose.yml
nano docker-compose.yml
docker-compose up -d
mkdir laba1
cd laba1
cd -
mkdir laba1
cd laba1
nano docker-compose.yml~
nano Dockerfile
FROM php:8.2-apache
RUN apt-get update && apt-get install -y     libpng-dev     libjpeg-dev     libfreetype6-dev     libzip-dev     zip     unzip     && docker-php-ext-configure gd --with-freetype --with-jpeg     && docker-php-ext-install -j$(nproc) gd pdo pdo_mysql zip
docker-compose up -d
sudo apt-get update
sudo apt-get install     ca-certificates     curl     gnupg     lsb-release -y
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y
sudo usermod -aG docker $USER
newgrp docker
docker ps
cd ~
mkdir drupal-project
mkdir drupal-project1
cd drupal-project
mkdir -p {config/nginx/conf.d,config/drupal,modules,themes,backups,ssl}
ls -la
nano docker-compose.yml
cd ~/drupal-project/config/nginx/conf.d
nano drupal.conf
cd ~/drupal-project
cd ~/drupal-project/config/drupal
nano settings.php
cd ~/drupal-project
ls -la
cat docker-compose.yml | head -20
tree 
sudo snap install tree
tree 
docker compose up -d
docker ps
docker compose exec postgres pg_isready -U drupaluser
curl -I http://localhost
curl -I http://localhost:8080
docker compose up -d
docker ps
sudo snap install tree
cat docker-compose.yml | head -20
ls -la
docker compose up -d
docker compose down
docker compose up -d
mkdr joomla-docker
mkdir joomla-docker
cd joomla-docker
nano .env
nano docker-compose.yml
nano README.md
docker-compose down
nano docker-compose.yml
docker-compose down
docker-compose ps
docker-compose up -d
nano .env
nano docker-compose.yml
docker-compose down -v
docker-compose up -d
nano init.sql
nano docker-compose.yml
docker exec -it joomla_mysql mysql -u root -p
nano .env
docker exec -it joomla_mysql mysql -u root -p
docker-compose up -d
mkdir joomla-docker
cd joomla-docker
nano docker-compose.yml
mkdir config
cd joomla-docker/config
cd joomla-docker/config/
docker-compose up -d
nano docker-compose.yml
docker-compose up -d
docker-compose ps
nano php.ini
sudo docker run hello-world
mkdir ~/bash-project
cd ~/bash-project
nano git_tree.sh
chmod +x git_tree.sh
mkdir test-git-repo
cd test-git-repo
git init
echo "# Тестовый проект" > README.md
git add .
git commit -m "Первый коммит"
git config --global user.name "Rahim"
git config --global user.email "tojiboevrahim04@gmail.com"
git config --global --list
cd ~/bash-project/test-git-repo
git add .
git commit -m "Тестовый коммит"
git checkout -b feature-branch
echo "Новая функциональность" > feature.txt
git add .
git commit -m "Добавлена новая функциональность"
git checkout main
mkdir ~/git_scripts
cd ~/git_scripts
bash --version
git --version
sudo apt update && sudo apt install git
nano git_tree_viewer.sh
