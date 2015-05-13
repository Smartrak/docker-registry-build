FROM nginx:1.7

COPY nginx.conf /etc/nginx/nginx.conf
COPY registry.conf /etc/nginx/conf.d/registry.conf
COPY registry.htpasswd /etc/nginx/registry.htpasswd

#if you have ssl
COPY registry.crt /etc/ssl/certs/registry.crt
COPY registry.key /etc/ssl/private/registry.key

EXPOSE 443
