# quick-infra

## Run single node environment

- run-compose.sh

## Run on multi node production environment

- mv caddy/Caddyfile caddy/Caddyfile.local && mv caddy/Caddyfile.prd caddy/Caddyfile
- sed -i 's/driver: bridge/driver: overlay/g' compose/00-base.yml
- run-swarm.sh
