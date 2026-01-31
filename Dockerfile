# Simple static site Docker image served by nginx
FROM nginx:alpine
COPY frontend/ /usr/share/nginx/html/
