# RabbitMQ domain events

RabbitMQ transporte les evenements metier entre services sans couplage HTTP synchrone. La V1 sert au workflow de suppression utilisateur: `auth-service` orchestre, `analysis-store-service` nettoie ses donnees, puis `auth-service` finalise.

## Service Compose

Le service `rabbitmq` utilise l'image `rabbitmq:3-management`.

Ports locaux:
- `5672`: AMQP pour les services applicatifs et les tests locaux.
- `15672`: interface web de management RabbitMQ.

Les deux ports sont lies a `127.0.0.1` dans le compose de reference. Ne pas exposer `15672` publiquement en production sans authentification, filtrage reseau et TLS.

## Variables

- `RABBITMQ_USER`: utilisateur RabbitMQ cree au demarrage.
- `RABBITMQ_PASSWORD`: mot de passe RabbitMQ.
- `RABBITMQ_URL`: URL AMQP consommee par les services, par defaut `amqp://app:change_me@rabbitmq:5672`.
- `RABBITMQ_EXCHANGE`: exchange topic durable, par defaut `domain.events`.
- `RABBITMQ_QUEUE_AUTH`: queue de `auth-service`, par defaut `auth-service.user-deletion`.
- `RABBITMQ_QUEUE_ANALYSIS_STORE`: queue de `analysis-store-service`, par defaut `analysis-store-service.user-deletion`.
- `RABBITMQ_AMQP_PORT`: port AMQP expose en local, par defaut `5672`.
- `RABBITMQ_MANAGEMENT_PORT`: port UI expose en local, par defaut `15672`.

## Topologie

Exchange:
- `domain.events`
- type `topic`
- durable

Routing keys V1:
- `user.deletion.requested`
- `user.data.anonymized`
- `user.deleted`

Contrat detaille: [contracts/events/user-deletion.md](contracts/events/user-deletion.md)

Queues V1:
- `analysis-store-service.user-deletion`, binding `user.deletion.requested`.
- `auth-service.user-deletion`, binding `user.data.anonymized`.

La DLQ n'est pas activee dans cette V1 pour rester coherente avec le code applicatif minimal. Elle est documentee comme amelioration future si les strategies de retry/dead-letter deviennent communes a plusieurs services.

## Acces local

Demarrer RabbitMQ seul:

```bash
docker compose up -d rabbitmq
```

Verifier la sante:

```bash
docker compose ps rabbitmq
```

Interface management locale:

```text
http://localhost:15672
```

Identifiants: `RABBITMQ_USER` / `RABBITMQ_PASSWORD` depuis `.env`.

## Monitoring Prometheus

RabbitMQ expose des metriques Prometheus via le plugin officiel `rabbitmq_prometheus`, active au demarrage par le fichier `rabbitmq/enabled_plugins` monte dans le conteneur. Le fichier `rabbitmq/rabbitmq.conf` fixe le port interne de l'exporter a `15692`.

Le endpoint est disponible dans le reseau Docker a l'adresse:

```text
http://rabbitmq:15692/metrics
```

Ce port n'est pas publie sur l'hote dans le compose de reference. Prometheus scrape RabbitMQ via le job `rabbitmq` et la target `rabbitmq:15692`.

Grafana provisionne le dashboard `Analyse Basket - RabbitMQ` depuis `observability/grafana/dashboards/analyse-basket-rabbitmq.json`. Il couvre la sante globale, la charge, les queues, les messages ready/unacked/totaux, les debits publish/deliver-get/ack, les consumers, les connexions/channels, la memoire, le disque et les alarmes.

### Verification locale

```bash
docker compose ps rabbitmq
docker compose exec prometheus wget -qO- http://rabbitmq:15692/metrics
```

Dans Prometheus (`http://localhost:9090`), verifier `Status > Targets` puis la target `rabbitmq`. Dans Grafana (`http://localhost:3003`), ouvrir le dossier `Analyse Basket` puis le dashboard `Analyse Basket - RabbitMQ`.

### Precautions production

Ne pas exposer publiquement les ports `5672`, `15672` ou `15692` sans filtrage reseau, authentification adaptee et TLS. Le endpoint metrics peut reveler des informations operationnelles sensibles comme les noms de queues, les volumes de messages et l'etat des ressources.
