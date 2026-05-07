# RabbitMQ Business Metrics dashboard

Ce dashboard Grafana suit les metriques metier RabbitMQ exposees par `auth-service` et `analysis-store-service`.
Il complete le dashboard `Analyse Basket - RabbitMQ`, qui reste centre sur les metriques techniques du broker RabbitMQ.

## Dashboard

- Titre: `RabbitMQ Business Metrics`
- UID: `rabbitmq-business-metrics`
- Dossier Grafana: `Analyse Basket`
- Fichier provisionne: `observability/grafana/dashboards/rabbitmq-business-metrics.json`
- Datasource: Prometheus provisionnee avec l'uid `prometheus`

Grafana charge automatiquement ce dashboard depuis le provider existant:

```text
observability/grafana/provisioning/dashboards/dashboards.yml
```

## Services concernes

- `auth-service`
- `analysis-store-service`

Prometheus scrape deja ces services via:

```yaml
- job_name: auth-service
  metrics_path: /metrics
  targets:
    - auth-service:3000

- job_name: analysis-store-service
  metrics_path: /metrics
  targets:
    - analysis-store-service:3001
```

## Metriques utilisees

Metriques communes RabbitMQ metier:

- `rabbitmq_business_events_published_total`
- `rabbitmq_business_events_consumed_total`
- `rabbitmq_business_event_publish_duration_seconds`
- `rabbitmq_business_event_processing_duration_seconds`

Metriques `auth-service`:

- `user_deletion_workflows_started_total`
- `user_deletion_workflows_completed_total`
- `user_deletion_workflows_failed_total`
- `user_deletion_workflow_duration_seconds`

Metriques `analysis-store-service`:

- `analysis_user_cleanup_resources_total`
- `analysis_user_cleanup_duration_seconds`

## Labels importants

Labels communs:

- `service`: `auth-service` ou `analysis-store-service`
- `event_type`: `user.deletion.requested`, `user.data.anonymized`, `user.deleted`, `unknown`
- `routing_key`: `user.deletion.requested`, `user.data.anonymized`, `user.deleted`, `unknown`
- `result`: `success`, `failure`, `ignored`, `duplicate`, `invalid`

Labels workflow auth:

- `requested_by`: `self`, `admin`, `system`, `unknown`
- `reason`: `user_request`, `admin_action`, `test`, `unknown`
- `failure_step`: `publish_requested_event`, `consume_anonymized_event`, `finalize_user`, `publish_deleted_event`, `unknown`
- `result`: `completed`, `failed`

Labels cleanup analysis:

- `resource`: `timeline`, `private_panel`, `public_panel`
- `action`: `deleted`, `anonymized`
- `result`: `success`, `failure`, `duplicate`, `invalid`

Aucun label du dashboard n'utilise de valeur sensible ou a forte cardinalite comme userId, eventId, correlationId, email, pseudo ou payload metier.

## Sections du dashboard

- Vue globale RabbitMQ metier: evenements publies/consommes, echecs, ratio de succes, evenements ignores/dupliques/invalides.
- Debits par evenement: publish/consume par `event_type` et par `routing_key`.
- Latence RabbitMQ metier: p50/p95/p99 de publication et de traitement consumer.
- Workflow suppression utilisateur cote auth: started/completed/failed, echecs par etape, p95 de duree.
- Cleanup analysis-store: ressources supprimees/anonymisees, p95 cleanup, echecs/invalid/duplicate.
- Diagnostic: tables d'evenements publies/consommes et erreurs sur la derniere heure.

## PromQL utiles

Taux de publication par evenement:

```promql
sum by(event_type, result) (rate(rabbitmq_business_events_published_total[5m]))
```

Taux de consommation par evenement:

```promql
sum by(event_type, result) (rate(rabbitmq_business_events_consumed_total[5m]))
```

P95 de traitement consumer:

```promql
histogram_quantile(0.95, sum by(le, event_type) (rate(rabbitmq_business_event_processing_duration_seconds_bucket[5m])))
```

Workflows de suppression completes:

```promql
sum(rate(user_deletion_workflows_completed_total{service="auth-service"}[5m]))
```

Echecs de workflow par etape:

```promql
sum by(failure_step) (rate(user_deletion_workflows_failed_total{service="auth-service"}[5m]))
```

Ressources supprimees ou anonymisees:

```promql
sum by(resource, action) (rate(analysis_user_cleanup_resources_total{service="analysis-store-service"}[5m]))
```

P95 de cleanup:

```promql
histogram_quantile(0.95, sum by(le, result) (rate(analysis_user_cleanup_duration_seconds_bucket{service="analysis-store-service"}[5m])))
```

Diagnostic sur une heure:

```promql
sum by(service, event_type, result) (increase(rabbitmq_business_events_consumed_total[1h]))
sum by(service, event_type, result) (increase(rabbitmq_business_events_published_total[1h]))
```

## Verification

1. Demarrer l'infra:

```bash
docker compose up -d
```

2. Verifier les targets Prometheus:

```text
http://localhost:9090 > Status > Targets
```

Les targets `auth-service` et `analysis-store-service` doivent etre `UP`.

3. Verifier une metrique applicative dans Prometheus:

```promql
rabbitmq_business_events_published_total
rabbitmq_business_events_consumed_total
```

4. Ouvrir Grafana:

```text
http://localhost:3003
```

Dans le dossier `Analyse Basket`, ouvrir `RabbitMQ Business Metrics`.

5. Generer une suppression utilisateur via l'API ou Postman pour voir evoluer les courbes de publication, consommation, workflow auth et cleanup analysis-store.

## Limites

- Le dashboard depend des metriques applicatives exposees par `/metrics`; si aucun workflow RabbitMQ n'a encore ete execute, certains panels affichent simplement `No data`.
- Le dashboard ne remplace pas le dashboard technique RabbitMQ du broker.
- Le dashboard ne cree pas d'alerting et n'ajoute pas Alertmanager.
