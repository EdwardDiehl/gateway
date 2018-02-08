#!/usr/bin/env sh

set -o errexit    # always exit on error
set -o nounset    # fail on unset variables

# Read more at https://docs.traefik.io/configuration/acme/#storage
if [ ! -f /etc/traefik/acme/acme.json ]
then
  mkdir -p /etc/traefik/acme/
  touch /etc/traefik/acme/acme.json
  chmod 600 /etc/traefik/acme/acme.json
fi

traefik "$@"
