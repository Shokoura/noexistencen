# Static hosting of the web port with nginx
FROM nginx:1.27-alpine
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY . /usr/share/nginx/html
RUN rm -f /usr/share/nginx/html/Dockerfile /usr/share/nginx/html/nginx.conf /usr/share/nginx/html/serve.js /usr/share/nginx/html/*.bat /usr/share/nginx/html/*.sh /usr/share/nginx/html/README.md
EXPOSE 80
