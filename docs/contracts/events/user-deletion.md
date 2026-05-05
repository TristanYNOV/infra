# User deletion event contract

Contrat partage du workflow de suppression utilisateur event-driven.

## Exchange

- Nom: `domain.events`
- Type: `topic`
- Durable: oui

## Routing keys

- `user.deletion.requested`
- `user.data.anonymized`
- `user.deleted`

## Queues V1

- `analysis-store-service.user-deletion`, binding `user.deletion.requested`
- `auth-service.user-deletion`, binding `user.data.anonymized`

## Envelope commun

```json
{
  "eventId": "uuid",
  "eventType": "user.deletion.requested",
  "version": 1,
  "occurredAt": "2026-05-04T15:00:00.000Z",
  "producer": "auth-service",
  "correlationId": "uuid",
  "data": {}
}
```

Champs obligatoires:
- `eventId`: UUID unique de l'evenement.
- `eventType`: nom metier de l'evenement.
- `version`: version du contrat, `1` pour cette V1.
- `occurredAt`: date ISO.
- `producer`: service producteur.
- `correlationId`: identifiant du workflow.
- `data`: payload metier.

## user.deletion.requested

Producteur: `auth-service`

Consommateurs V1: `analysis-store-service`

```json
{
  "eventId": "uuid",
  "eventType": "user.deletion.requested",
  "version": 1,
  "occurredAt": "2026-05-04T15:00:00.000Z",
  "producer": "auth-service",
  "correlationId": "uuid",
  "data": {
    "userId": "user-uuid",
    "requestedBy": "self",
    "reason": "user_request"
  }
}
```

`requestedBy`: `self`, `admin`, `system`

`reason`: `user_request`, `admin_action`, `test`, `unknown`

## user.data.anonymized

Producteur: `analysis-store-service`

Consommateur: `auth-service`

```json
{
  "eventId": "uuid",
  "eventType": "user.data.anonymized",
  "version": 1,
  "occurredAt": "2026-05-04T15:01:00.000Z",
  "producer": "analysis-store-service",
  "correlationId": "uuid",
  "data": {
    "userId": "user-uuid",
    "service": "analysis-store-service",
    "deletedResources": {
      "timelines": 0,
      "privatePanels": 0
    },
    "anonymizedResources": {
      "publicPanels": 0
    }
  }
}
```

## user.deleted

Producteur: `auth-service`

Consommateurs: futurs services.

```json
{
  "eventId": "uuid",
  "eventType": "user.deleted",
  "version": 1,
  "occurredAt": "2026-05-04T15:02:00.000Z",
  "producer": "auth-service",
  "correlationId": "uuid",
  "data": {
    "userId": "user-uuid",
    "deletedAt": "2026-05-04T15:02:00.000Z"
  }
}
```
