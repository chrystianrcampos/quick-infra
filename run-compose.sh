docker compose \
  -f compose/00-base.yml \
  -f compose/01-caddy.yml \
  -f compose/02-opensearch.yml \
  -f compose/03-opensearch-dashboards.yml \
  up -d --remove-orphans
