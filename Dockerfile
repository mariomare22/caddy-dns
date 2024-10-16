#Build Test
FROM caddy:2.8.4-builder-alpine AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/ionos \
    --with github.com/hslatman/caddy-crowdsec-bouncer/http@main

FROM caddy:2.8.4-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

CMD ["caddy", "run", "--config", "/etc/caddy/Caddyfile", "--adapter", "caddyfile"]
