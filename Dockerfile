#Build Test
FROM caddy:2.11.2-builder-alpine AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/ionos

FROM caddy:2.11.2-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

CMD ["caddy", "run", "--config", "/etc/caddy/Caddyfile", "--adapter", "caddyfile"]
