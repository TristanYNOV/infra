# Observability V1

Cette V1 ajoute Prometheus et Grafana pour suivre la charge applicative, les latences, les erreurs HTTP, le runtime Node.js et quelques compteurs métier.

Uptime Kuma reste responsable de l'uptime et de la status page. Cette stack ne remplace pas ce rôle.

## Lancer

```bash
cp .env.example .env
docker compose up -d
```

URLs locales:
- Prometheus: `http://localhost:9090`
- Grafana: `http://localhost:3003`
- Traefik dashboard: `http://localhost:8080`

Prometheus et Grafana sont publiés uniquement sur `127.0.0.1` par le compose.

## Targets Prometheus

Prometheus scrape:
- `prometheus:9090`
- `front-service:4000/metrics`
- `auth-service:3000/metrics`
- `analysis-store-service:3001/metrics`
- `traefik:8080/metrics`

Pour vérifier: ouvrir Prometheus, puis `Status > Targets`.

## Grafana

Grafana provisionne automatiquement:
- la datasource Prometheus,
- les dashboards du dossier `observability/grafana/dashboards`.

Il n'y a pas d'import manuel à faire dans l'UI.

## Hors scope V1

Volontairement non ajoutés:
- postgres-exporter,
- mongodb-exporter,
- node-exporter,
- cAdvisor,
- Loki,
- Tempo,
- OpenTelemetry Collector,
- Promtail,
- Alertmanager,
- monitoring BDD dédié.

Les métriques applicatives ne doivent pas contenir de données sensibles ni de labels à forte cardinalité.
