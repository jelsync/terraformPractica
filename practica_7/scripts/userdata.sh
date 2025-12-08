#!/bin/bash
sudo yum install -y nginx
sudo systemctl enable nginx
sudo systemctl start nginx
echo "<h1>Hello from Terraform!</h1>" > /var/www/html/index.html