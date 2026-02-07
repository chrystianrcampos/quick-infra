# quick-infra

## Requirements

- Ubuntu 24.04+
- Docker 25.0+

## Run single node environment

- run-compose.sh

## Run on multi node environment

- sed -i 's/driver: bridge/driver: overlay/g' compose/00-base.yml
- run-swarm.sh

## Run on production

- P=$(openssl rand -base64 24 | tr -dc 'a-zA-Z0-9' | head -c 20); grep -rIl "StrongPassword123!" . | xargs sed -i "s|StrongPassword123!|$P|g"; echo "$P"
- mv caddy/Caddyfile caddy/Caddyfile.local && mv caddy/Caddyfile.prd caddy/Caddyfile
