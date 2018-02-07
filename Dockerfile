FROM alpine:latest

LABEL maintainer="Alexander Sulim <hello@sul.im>" \
      version="0.1.0"

COPY --from=traefik:v1.5.1 /etc/ssl/certs/ /etc/ssl/certs/
COPY --from=traefik:v1.5.1 /traefik /usr/local/bin/

# Read more at http://docs.traefik.io/basics/#configuration-file
COPY traefik.toml /etc/traefik/

# Read more at https://docs.traefik.io/configuration/entrypoints/#authentication
COPY .htpasswd /etc/traefik/

# Read more at https://docs.traefik.io/configuration/acme/#storage
RUN mkdir -p /etc/traefik/acme/ && \
    touch /etc/traefik/acme/acme.json && \
	  chown 600 /etc/traefik/acme/acme.json

EXPOSE 80

ENTRYPOINT ["traefik"]
