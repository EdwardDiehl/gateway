FROM alpine:latest

LABEL maintainer="Alexander Sulim <hello@sul.im>" \
      version="0.1.0"

COPY --from=traefik:v1.5.1 /etc/ssl/certs/ /etc/ssl/certs/
COPY --from=traefik:v1.5.1 /traefik /usr/local/bin/

COPY docker-entrypoint.sh /usr/local/bin/

# Read more at http://docs.traefik.io/basics/#configuration-file
COPY traefik.toml /etc/traefik/

EXPOSE 80

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
