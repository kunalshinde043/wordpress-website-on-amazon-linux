#!/bin/bash
# deploy_wordpress.sh
# Script to install and configure WordPress on Amazon Linux 2 EC2 with Apache, PHP, and MariaDB

echo "=== Step 1: Update System and Install Required Packages ==="
sudo yum update -y
sudo yum install httpd mariadb105-server php -y
sudo systemctl start httpd mariadb php-fpm
sudo systemctl status httpd mariadb php-fpm
sudo systemctl enable httpd mariadb php-fpm

echo "=== Step 2: Install PHP MySQL Extension ==="
sudo yum install php8.4-mysqlnd.x86_64 -y

echo "=== Step 3: Download and Extract WordPress ==="
cd /var/www/html
sudo wget https://wordpress.org/latest.tar.gz
sudo tar -xvzf latest.tar.gz

echo "=== Step 4: Configure MariaDB Database ==="
echo "Now enter your MariaDB root password when prompted."
sudo mysql -p -e "CREATE DATABASE wordpressdb;"
sudo mysql -p -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'password';"

echo "=== Step 5: Set Permissions for the WordPress Directory ==="
cd wordpress/
sudo chown -R apache:apache /var/www/html/wordpress

echo "=== Step 6: WordPress and Database Connectivity ==="
echo "Visit: http://<your-ec2-public-ip>/wordpress in your browser to complete WordPress setup."

echo "=== Step 7: Restart Services and Verify ==="
sudo systemctl restart httpd mariadb php-fpm
sudo systemctl status httpd mariadb php-fpm

echo "=== WordPress Deployment Completed Successfully ==="
echo "Now go to: http://<your-ec2-public-ip>/wordpress to finish installation."
