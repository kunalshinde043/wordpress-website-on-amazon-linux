
# WordPress Deployment on Amazon Linux  
*"Bringing WordPress to Life on AWS EC2 with Apache, PHP, and MariaDB"*  

---

## Overview  
This project demonstrates how to install and configure **WordPress** on an **Amazon Linux EC2 instance** using **Apache (httpd)**, **PHP**, and **MariaDB**. It covers the complete setup from preparing the server to creating a database and configuring permissions.

---

## Prerequisites  
Before starting, ensure you have:  
- An **Amazon Linux 2 EC2 instance** running  
- **Security groups** allowing inbound traffic on:
  - Port **22 (SSH)**
  - Port **80 (HTTP)**
- A **key pair (.pem)** for SSH access  
- Basic knowledge of Linux commands  

---

## Steps Followed  

### 1. Update System and Install Required Packages  
```bash
sudo yum update -y
sudo yum install httpd mariadb105-server php -y
sudo systemctl start httpd mariadb php-fpm
sudo systemctl status httpd mariadb php-fpm
````

![alt text](image.png)

```bash
sudo systemctl enable httpd mariadb php-fpm
```

![alt text](image-1.png)

### 2. Install PHP MySQL Extension

```bash
sudo yum install php8.4-mysqlnd.x86_64 -y
```

![alt text](image-2.png)

### 3. Download and Extract WordPress

```bash
cd /var/www/html
sudo wget https://wordpress.org/latest.tar.gz
sudo tar -xvzf latest.tar.gz
```

![alt text](image-3.png)

### 4. Configure MariaDB Database

Login to MySQL:

```bash
sudo mysql -p
```

Inside MySQL run:

```sql
CREATE DATABASE wordpressdb;
ALTER USER 'root'@'localhost' IDENTIFIED BY 'password';
```

![alt text](image-7.png)
Exit MySQL.

### 5. Set Permissions for the WordPress Directory

```bash
cd wordpress/
sudo chown -R apache:apache /var/www/html/wordpress
```

### 6. WordPress and Database Connectivity

Visit your site using public and follow below steps.

```
http://<your-ec2-public-ip>/wordpress
```

6.1 Click on **Let’s go!**

![alt text](image-4.png)

6.2 Enter the Database Name you created along with the username and password.
![alt text](image-5.png)

6.3 If you see this confirmation screen, you’re good to go!
![alt text](image-6.png)

### 7. Restart Services and Verify

```bash
sudo systemctl restart httpd mariadb php-fpm
sudo systemctl status httpd mariadb php-fpm
```

### 8. Customize Your Website

8.1 I added a simple post for Dussehra. You can create your own posts with images and URLs.
![alt text](image-8.png)

---

### 9. Check Data Insertion and Retrieval

9.1 I added a comment on my post using the same root user.
![alt text](image-9.png)

9.2 To verify the data in the database:

```bash
## Switch to the database you created
use wordpressdb;

## Show all tables in the database
show tables;

## Check our comment
select * from comments;
```

![alt text](image-10.png)

---

## Result

WordPress is now installed on your Amazon Linux EC2 instance and fully functional. You can complete the setup by visiting:

```
http://<your-ec2-public-ip>/wordpress
```

---

## Tech Stack

* **Amazon Linux 2 (EC2)**
* **Apache (httpd)**
* **MariaDB 10.5**
* **PHP 8.4 + MySQL extension**
* **WordPress**

---

## Summary

In this project, we deployed **WordPress** on Amazon Linux using **Apache**, **MariaDB**, and **PHP**. This walkthrough covers the full process — from installing packages and creating a database to configuring permissions and setting up WordPress for its initial use.

---

## Contact

If you face any issues or have questions, feel free to reach out to me:

* **Email:** [kunalshinde066@gmail.com](mailto:kunalshinde066@gmail.com)
* **LinkedIn:** [https://www.linkedin.com/in/kunal-shinde-1b17a2205/]
