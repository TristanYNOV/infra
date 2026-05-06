# Postman kit - infra

Ce dossier contient une collection Postman globale pour tester la stack lancee par `infra`.

## Fichiers

- `analyse-basket-infra.postman_collection.json`
- `analyse-basket-infra.local.postman_environment.json`
- `scripts/run-collection.sh`

## Usage recommande

1. Demarrer la stack:

```bash
make up
```

2. Importer dans Postman:
   - la collection `analyse-basket-infra.postman_collection.json`
   - l'environnement `analyse-basket-infra.local.postman_environment.json`

3. Selectionner l'environnement `Analyse Basket infra local`.

4. Lancer les dossiers dans cet ordre:
   - `00 - Health / Front / Observability`
   - `10 - Auth user`
   - `20 - Admin`
   - `30 - Analysis store via gateway`
   - `40 - RabbitMQ / user deletion workflow`

## Script Newman

Si Newman est installe localement:

```bash
postman/scripts/run-collection.sh
```

Tu peux aussi ajouter des options Newman:

```bash
postman/scripts/run-collection.sh --folder "40 - RabbitMQ / user deletion workflow"
```

## Variables importantes

- `gatewayBaseUrl`: Traefik, par defaut `http://localhost`
- `prometheusBaseUrl`: par defaut `http://localhost:9090`
- `grafanaBaseUrl`: par defaut `http://localhost:3003`
- `rabbitBaseUrl`: UI/API management RabbitMQ, par defaut `http://localhost:15672`
- `rabbitUser` / `rabbitPassword`: doivent correspondre a `.env`
- `adminEmail` / `adminPassword`: doivent correspondre a `.env`

## Scripts Postman inclus

- La collection calcule automatiquement les bases d'URL.
- Les tokens JWT sont injectes automatiquement selon le dossier ou le nom de requete.
- Les requetes de login stockent les tokens et les `userId`.
- Les requetes de creation timelines/panels stockent les IDs crees.
- Le dossier RabbitMQ permet de tester la suppression utilisateur sans front.

## Notes RabbitMQ

Le workflow fonctionnel a privilegier est `DELETE /me` avec le token du candidat de suppression.

La requete `RabbitMQ - publish user.deletion.requested` sert de test manuel du broker et des consumers. Elle bypass l'API `auth-service`; a utiliser seulement pour diagnostiquer RabbitMQ ou relancer un evenement de test.
