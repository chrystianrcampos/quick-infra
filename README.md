# quick-infra

Modular Docker Compose files for assembling infrastructure on demand.

## Requirements

- Ubuntu 24.04+
- Docker 25.0+

## Available Services

| Compose File | Service | Port | Access |
|---|---|---|---|
| `01-caddy.yml` | Caddy (reverse proxy) | 80, 443 | — |
| `02-opensearch.yml` | OpenSearch | — | `https://opensearch.localhost` |
| `03-opensearch-dashboards.yml` | OpenSearch Dashboards | — | `https://dashboards.localhost` |
| `04-fluentbit.yml` | Fluent Bit | 24224 | — |
| `05-postgres.yml` | PostgreSQL 17 | 5432 | `localhost:5432` |
| `06-pgadmin.yml` | pgAdmin | — | `https://pgadmin.localhost` |

All services require `00-base.yml` (shared network and volumes). Web UIs are accessed via Caddy reverse proxy.

## Usage Examples

```bash
# Observability stack
docker compose -f compose/00-base.yml -f compose/01-caddy.yml -f compose/02-opensearch.yml -f compose/03-opensearch-dashboards.yml -f compose/04-fluentbit.yml up -d

# PostgreSQL + pgAdmin
docker compose -f compose/00-base.yml -f compose/01-caddy.yml -f compose/05-postgres.yml -f compose/06-pgadmin.yml up -d

# PostgreSQL only (direct access on port 5432)
docker compose -f compose/00-base.yml -f compose/05-postgres.yml up -d
```

## Run on multi node environment

- sed -i 's/driver: bridge/driver: overlay/g' compose/00-base.yml
- run-swarm.sh

## Run on production

- P=$(openssl rand -base64 24 | tr -dc 'a-zA-Z0-9' | head -c 20); grep -rIl 'StrongPassword123!' . | xargs sed -i "s|StrongPassword123\!|$P|g"; echo "$P"
- mv caddy/Caddyfile caddy/Caddyfile.local && mv caddy/Caddyfile.prd caddy/Caddyfile
