FROM caddy:2.5.1-builder-alpine AS builder

RUN xcaddy build \
    --with github.com/greenpau/caddy-security \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.5.1-builder-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
