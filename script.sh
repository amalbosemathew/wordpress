#!/bin/bash
yum install mariadb-server mariadb -y
systemctl start mariadb
systemctl enable mariadb
mysql -u root mysql -e "UPDATE mysql.user SET Password = PASSWORD('mysql') WHERE User = 'root';"
mysql -u root mysql -e "FLUSH PRIVILEGES;"
mysql -u root -pmysql -e "create database wordpress;"
mysql -u root -pmysql -e "create user wordpress@'localhost' identified by 'wordpress';"
mysql -u root -pmysql -e "grant all privileges on wordpress.* to wordpress@'localhost';"
mysql -u root -pmysql -e "flush privileges;"
systemctl restart mariadb
