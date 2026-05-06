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
- `rabbitmq:15692/metrics` via le plugin officiel `rabbitmq_prometheus`

Pour vérifier: ouvrir Prometheus, puis `Status > Targets`.

## Grafana

Grafana provisionne automatiquement:
- la datasource Prometheus,
- les dashboards du dossier `observability/grafana/dashboards`, dont `Analyse Basket - RabbitMQ`.

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

## Monitoring RabbitMQ

RabbitMQ expose ses metriques Prometheus via le plugin officiel `rabbitmq_prometheus`. Le compose active ce plugin avec le fichier persistant `rabbitmq/enabled_plugins` et configure l'exporter avec `rabbitmq/rabbitmq.conf`.

- Port interne de metrics: `15692`.
- Endpoint scrape: `http://rabbitmq:15692/metrics` depuis le reseau Docker `infra-backend`.
- Job Prometheus: `rabbitmq`.
- Dashboard Grafana provisionne: `Analyse Basket - RabbitMQ`.

Le port `15692` n'est pas publie sur l'hote dans le compose de reference: Prometheus y accede uniquement via le reseau Docker. Les ports locaux deja publies pour RabbitMQ restent lies a `127.0.0.1`. En production, ne pas exposer publiquement l'interface management `15672`, AMQP `5672` ni le endpoint metrics `15692` sans controle reseau, authentification adaptee et TLS.

Le dashboard RabbitMQ permet de suivre:
- l'etat de la target Prometheus RabbitMQ;
- les messages ready, unacked et totaux;
- les debits publish, deliver/get et ack;
- le nombre de queues, consumers, connexions et channels;
- la memoire utilisee, le disque disponible et les alarmes memoire/disque;
- les queues les plus chargees et les signes de saturation comme les messages par consumer.

## Validation manuelle RabbitMQ

1. Demarrer l'infra avec la commande documentee du repo: `make up` ou `docker compose up -d`.
2. Verifier que RabbitMQ demarre: `docker compose ps rabbitmq`.
3. Verifier le endpoint metrics depuis le reseau Docker, par exemple depuis le conteneur Prometheus: `docker compose exec prometheus wget -qO- http://rabbitmq:15692/metrics`.
4. Ouvrir Prometheus localement sur `http://localhost:9090`, puis `Status > Targets`, et verifier que la target `rabbitmq` est `UP`.
5. Dans Prometheus, rechercher une metrique RabbitMQ comme `rabbitmq_queue_messages_ready` ou `rabbitmq_node_mem_used`.
6. Ouvrir Grafana sur `http://localhost:3003`.
7. Verifier que le dashboard `Analyse Basket - RabbitMQ` est disponible dans le dossier `Analyse Basket`.
8. Generer une petite activite RabbitMQ via les services applicatifs ou l'interface management locale si disponible.
9. Verifier que les courbes de messages, queues, rates, consumers, connexions et alarmes evoluent.
