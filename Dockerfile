FROM akilli/base
LABEL maintainer="Ayhan Akilli"

RUN apk add --no-cache \
        nginx \
        nginx-mod-http-geoip \
        nginx-mod-http-image-filter \
        openssl && \
    rm /etc/nginx/conf.d/default.conf || true && \
    chown -R app:app /var/lib/nginx && \
    app-user && \
    app-chown && \
    mkdir -p /etc/nginx/ssl && \
    openssl dhparam -out /etc/nginx/ssl/dhparam.pem 2048
COPY etc/ /etc/nginx/
COPY default.conf /app/nginx.conf

CMD ["nginx"]
