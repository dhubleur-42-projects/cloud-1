FROM caddy:2.7.5-builder AS builder

RUN xcaddy build \
	--with github.com/caddy-dns/cloudflare

FROM caddy:2.7.5-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

RUN mkdir -p /etc/caddy
COPY ./Caddyfile /etc/caddy/Caddyfile

ARG DOMAIN_NAME
ARG CLOUDFLARE_KEY

RUN sed -i "s/\${DOMAIN_NAME}/${DOMAIN_NAME}/g" /etc/caddy/Caddyfile
RUN sed -i "s/\${CLOUDFLARE_KEY}/${CLOUDFLARE_KEY}/g" /etc/caddy/Caddyfile

EXPOSE 80 443

CMD ["caddy", "run", "--config", "/etc/caddy/Caddyfile", "--adapter", "caddyfile"]