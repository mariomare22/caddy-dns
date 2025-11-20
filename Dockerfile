#Build Test
FROM caddy:2.10.2-builder-alpine AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/ionos \
    --with github.com/hslatman/caddy-crowdsec-bouncer/http@main \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.10.0-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

CMD ["caddy", "run", "--config", "/etc/caddy/Caddyfile", "--adapter", "caddyfile"]
