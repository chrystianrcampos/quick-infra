docker --context default \
  stack deploy \
  -c compose/00-base.yml \
  -c compose/01-caddy.yml \
  -c compose/02-opensearch.yml \
  -c compose/03-opensearch-dashboards.yml \
  -c compose/04-fluentbit.yml \
  --prune \
  --detach=true \
  qi
