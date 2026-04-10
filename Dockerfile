# Start with the tiny, secure Nginx image
FROM nginx:alpine

# Copy your server configuration
COPY default.conf /etc/nginx/conf.d/default.conf

# Tell Nginx to trust the Docker subnet and extract the Cloudflare true IP
RUN printf "set_real_ip_from 172.16.0.0/12;\nreal_ip_header CF-Connecting-IP;\n" > /etc/nginx/conf.d/real-ip.conf

# ONLY copy the actual website files, leaving the Dockerfiles and configs safely behind
COPY public/ /usr/share/nginx/html