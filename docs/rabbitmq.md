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
