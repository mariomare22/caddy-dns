#Build Test
FROM caddy:2.11.4-builder-alpine AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/hetzner/v2 \
    --with github.com/greenpau/caddy-security

FROM caddy:2.11.4-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

CMD ["caddy", "run", "--config", "/etc/caddy/Caddyfile", "--adapter", "caddyfile"]
