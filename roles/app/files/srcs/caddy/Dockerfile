FROM iarekylew00t/caddy-cloudflare:latest

COPY ./Caddyfile /etc/Caddyfile

RUN sed -i "s/\${DOMAIN_NAME}/${DOMAIN_NAME}/g" /etc/Caddyfile
RUN sed -i "s/\${CLOUDFLARE_KEY}/${CLOUDFLARE_KEY}/g" /etc/caddy/Caddyfile

EXPOSE 80 443
