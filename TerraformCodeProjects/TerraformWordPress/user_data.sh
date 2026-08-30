#!/bin/bash
sudo apt-get update -y

# install mysql client and apache server
sudo apt-get install -y apache2
sudo systemctl enable apache2
sudo systemctl start apache2

# application dependencies you need for WordPress
sudo apt-get install -y php php-mysql php-curl php-gd php-mbstring php-xml php-zip libapache2-mod-php

# database server (MariaDB, MySQL-compatible)
sudo apt-get install -y mariadb-server
sudo systemctl enable mariadb
sudo systemctl start mariadb

# create the WordPress database and user
mysql -u root <<SQL
CREATE DATABASE IF NOT EXISTS ${db_name};
CREATE USER IF NOT EXISTS '${db_user}'@'localhost' IDENTIFIED BY '${db_password}';
GRANT ALL PRIVILEGES ON ${db_name}.* TO '${db_user}'@'localhost';
FLUSH PRIVILEGES;
SQL

# download and extract wordpress
cd /tmp
wget https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz
sudo cp -r wordpress/* /var/www/html/
sudo rm -f /var/www/html/index.html
# configure wp-config.php with the real DB credentials
cd /var/www/html
sudo cp wp-config-sample.php wp-config.php
sudo sed -i "s/database_name_here/${db_name}/" wp-config.php
sudo sed -i "s/username_here/${db_user}/" wp-config.php
sudo sed -i "s/password_here/${db_password}/" wp-config.php

# make wordpress run under apache user
sudo chown -R www-data:www-data /var/www/html/

# cleanup
rm -rf /tmp/wordpress /tmp/latest.tar.gz

sudo systemctl restart apache2