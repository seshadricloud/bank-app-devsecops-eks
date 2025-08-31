## How to convert an application from HTTP to HTTPS

### Steps:
- Update the system
```bash
sudo apt update
```
#
- Install Nginx using the following command:
```bash
sudo apt install nginx
```
#
- Once the installation is complete, start the Nginx service:
```bash
sudo service nginx start
```
#
- Enable Nginx to Start on Boot
```bash
sudo systemctl enable nginx
```
#
- Create an application Server Block:
  - Create a new Nginx server block configuration file for our bankapp application. You can do this by creating a new file in the /etc/nginx/sites-available/ directory. Let's name it bankapp: 
```bash
cd /etc/nginx/sites-available/
sudo touch bankapp
```
#
- Add the following code in the /etc/nginx/sites-available/bankapp file:
```bash
sudo vim /etc/nginx/sites-available/bankapp 
```
```bash
server {
    listen 80;
    server_name junoon.trainwithshubham.com; # Replace with your domain

    location / {
        proxy_pass http://localhost:8080; # Replace port with your application port
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    location ~ /\. {
        deny all;
    }
}
```
#
- Create a symbolic link to the configuration file in the sites-enabled directory:
```bash
sudo ln -s /etc/nginx/sites-available/bankapp /etc/nginx/sites-enabled/
```
#
- Test Nginx Configuration:
```bash
sudo nginx -t 
```
Note: If the test is successful, you should see: nginx: configuration file /etc/nginx/nginx.conf test is successful.
#
- Restart Nginx to apply the changes:
```bash
sudo systemctl restart nginx 
```
#
- Open your web browser and navigate to http://junoon.trainwithshubham.com. Replace junoon.trainwithshubham.com with your actual domain. You should now be able to access an application through Nginx.
#
- Now, apply SSL certificate to the Domain.
```bash
sudo apt install python3-certbot-nginx
```
```bash
certbot --version
```
```bash
certbot --nginx -d junoon.trainwithshubham.com
```
