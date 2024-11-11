---
sidebar_position: 2
---

# 01-Frontend

The frontend is the service in Expense to serve the web content over Nginx. This will have the webframe for the web application.

This is a static content and to serve static content we need a web server. This server

Developer has chosen Nginx as a web server and thus we will install Nginx Web Server. 

Install Nginx 
```shell
apt-get install nginx -y
```

Start & Enable Nginx service 
```shell
systemctl enable nginx 
systemctl start nginx 
```

:::info
Try to access the service once over the browser and ensure you get some default content.
:::


Remove the default content that web server is serving. 

```shell
rm -rf /usr/share/nginx/html/* 
```

Download the frontend content

```shell
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/expense-frontend-v2.zip 
```

Extract the frontend content.

```shell
cd /usr/share/nginx/html 
apt-get install unzip -y
unzip /tmp/frontend.zip
```

:::info
Try to access the nginx service once more over the browser and ensure you get expense content.
:::

Create Nginx Reverse Proxy Configuration.

```shell 
vim /etc/nginx/conf.d/expense.conf
```

Add the following content 

```nginx configuration title=/etc/nginx/conf.d/expense.conf
server {
    listen 80;  # Listening on port 80

    server_name 34.31.125.217;  # Add your server name or public IP

    # Proxy settings
    proxy_http_version 1.1;

    # Location for API requests
    location /api/ {
        proxy_pass http://localhost:8080/;  #add your backend private ip
    }

    # Health check
    location /health {
        stub_status on;
        access_log off;
    }
}
```

:::info Note

Ensure you replace the `localhost` with the actual private ip address of backend component server. Word `localhost` is just used to avoid the failures on the Nginx Server.

:::


Restart Nginx Service to load the changes of the configuration.

```shell 
systemctl restart nginx 
```

