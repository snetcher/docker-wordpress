FROM nginx:alpine

# It is assumed that SSL certificates are located in ..ssl from the config folder
COPY ssl/cert.crt /etc/ssl/certs/nginx-selfsigned.crt
COPY ssl/cert.key /etc/ssl/private/nginx-selfsigned.key

# COPY instruction regarding Dockerfile location
COPY config/nginx/default.conf /etc/nginx/conf.d/default.conf

EXPOSE 80 443
