# caddy-dns

Caddy docker-image compiled to work with DNS Challenge

```
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
(ionos) {
      tls {
        dns ionos YOUR_API_KEY
      }
}
my.domain.com {
      reverse_proxy http://resource
      import ionos
}
```
