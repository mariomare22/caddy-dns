# caddy-dns

Caddy docker-image compiled to work with Cloudflare DNS

```
version: "3.7"

services:
  caddy-sec:
    container_name: caddy-dns
    image: ghcr.io/mariomare22/caddy-dns:latest
    restart: unless-stopped
    ports:
      - "443:443"
    volumes:
      - ~/test/caddy/etc:/etc/caddy

```

create a `Caddyfile`

```
(cloudflare) {
      tls {
        dns cloudflare YOUR_API_KEY
      }
}
my.domain.com {
      reverse_proxy http://resource
      import cloudflare
}
```
