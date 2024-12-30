FROM ubuntu:24.04
RUN apt-get update
RUN apt-get install nginx -y
COPY index.nginx-debian.html /var/www/html
ENTRYPOINT ["nginx", "-g", "daemon off;"]


#docker run --name nginxc -it -d  -p 8080:80 nginx