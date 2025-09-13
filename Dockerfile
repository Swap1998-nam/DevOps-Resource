From ubuntu:latest
Run apt-get update && \ apt-get install -y nginx && \ apt-get clean
Copy index.html /var/www/html/index.html
Expose 80
