# infra

Repository d’infrastructure pour la plateforme d’analyse vidéo sportive.

Ce repo orchestre la stack applicative complète via Docker Compose, consomme des images déjà publiées sur GHCR (sans build local applicatif) et expose une gateway unique Traefik pour le routage HTTP interne/externe.

## Rôle du repo
- Orchestrer la stack de référence (prod locale / cible prod).
- Consommer les images publiées par les repos applicatifs (`front-service`, `auth-service`, `analysis-store-service`).
- Centraliser les conventions de routage Traefik, de santé applicative et de variables d’environnement.

## Architecture des services
Services démarrés par le compose principal :
- `traefik` : point d’entrée HTTP unique (`http://localhost`).
- `front-service` : service front SSR (port conteneur `4000`).
- `auth-service` : service d’authentification (port conteneur `3000`, dépend de `mongo`).
- `analysis-store-service` : service de stockage d’analyses (port conteneur `3001`, dépend de `postgres`).
- `analysis-store-migrate` : service one-shot exécutant les migrations PostgreSQL de `analysis-store-service`.
- `mongo` : base interne pour `auth-service`.
- `postgres` : base interne pour `analysis-store-service`.
- `rabbitmq` : broker d'evenements metier AMQP, avec UI management locale.

Routage Traefik :
- `/auth`, `/users`, `/me`, `/health` -> `auth-service`
- `/analysis` -> `analysis-store-service` (Traefik strip `/analysis` avant backend)
- tout le reste (`/`, pages SSR, assets) -> `front-service`

Préfixe public analysis :
- requête publique du front : `/analysis/api/...`
- Traefik retire `/analysis` (StripPrefix)
- backend `analysis-store-service` servi en interne sous `/api/...`

Chaîne d’auth analysis (gateway) :
- Le front appelle Traefik en same-origin avec `Authorization: Bearer <jwt>` (il ne forge jamais de headers internes `x-auth-*`)
- Traefik supprime d'abord tout header client `x-auth-*` entrant
- Traefik délègue la validation JWT à `auth-service` via `forwardAuth` sur l’endpoint interne `GET /internal/auth/context`, en transmettant explicitement `Authorization`
- Traefik ne propage vers `analysis-store-service` que les headers d'identité retournés par cette validation (`x-auth-user-id`, `x-auth-club-ids`, `x-auth-roles`)
- `x-auth-club-ids` n’est pas fourni actuellement par `auth-service`, mais reste propagé pour compatibilité future

Contexte identité/auth :
- validation JWT en gateway via `forwardAuth` (endpoint interne `auth-service /internal/auth/context`), puis propagation interne des headers d’identité (`x-auth-user-id`, `x-auth-club-ids`, `x-auth-roles`) vers les services qui en dépendent.

## Architecture du repo
- `docker-compose.yml` : orchestration principale de tous les services.
- `traefik/traefik.yml` : configuration statique Traefik.
- `.env.example` : exemple de configuration (images GHCR, secrets, runtime).
- `.env` : configuration locale réelle (non versionnée).
- `docs/contracts/` : contrats importés depuis les repos applicatifs.
- `docs/` : documentation d’architecture, sécurité, exploitation locale.

## Quickstart
```bash
cp .env.example .env
# 1) renseigner les images GHCR (FRONT_IMAGE, AUTH_IMAGE, ANALYSIS_STORE_IMAGE)
# 2) renseigner les secrets requis (AUTH_*, ANALYSIS_STORE_MASTER_KEY, ANALYSIS_STORE_DB_PASSWORD)

# login GHCR (si packages privés)
docker login ghcr.io

# pull + start de la stack complète
make pull
make up
make ps
make health
```

Le compose exécute automatiquement `analysis-store-migrate` (one-shot) avant `analysis-store-service`.

Vérifications rapides :
```bash
curl -i http://localhost/
curl -i http://localhost/health
curl -i http://localhost/analysis/api/health
```

Arrêt :
```bash
make down
```

## Configuration
Variables clés :
- Images : `FRONT_IMAGE`, `AUTH_IMAGE`, `ANALYSIS_STORE_IMAGE`
- Auth : `AUTH_JWT_SECRET`, `AUTH_ADMIN_*`, `AUTH_DB_NAME`, etc.
- Analysis store : `ANALYSIS_STORE_MASTER_KEY`, `ANALYSIS_STORE_DB_*`, `ANALYSIS_STORE_DATABASE_URL` (override optionnel)
- RabbitMQ : `RABBITMQ_URL`, `RABBITMQ_EXCHANGE`, `RABBITMQ_USER`, `RABBITMQ_PASSWORD`, queues de suppression utilisateur

Stratégie images GHCR :
- Chaque variable `*_IMAGE` doit contenir une référence complète :
  - `ghcr.io/<owner>/<repo>:<tag>`
  - `ghcr.io/<owner>/<repo>@sha256:<digest>`
- En prod, préférer les digests immuables (`@sha256`) quand disponibles.

## Troubleshooting
- **Accès GHCR refusé** : vérifier `docker login ghcr.io` et les droits `read:packages`.
- **Image inchangée après update** : vérifier que tag/digest a réellement changé, puis relancer `make pull`.
- **Doute sur la résolution compose** : exécuter `docker compose config`.
- **Vérifier les images réellement lancées** : `docker compose ps` puis `docker inspect <container>`.
- **Schéma PostgreSQL non initialisé** (volume existant/incohérent) :
  1. `docker compose run --rm analysis-store-migrate`
  2. `docker compose up -d analysis-store-service`

## Documentation
- [10 - Architecture](docs/10-architecture.md)
- [20 - Routing & sécurité](docs/20-routing-security.md)
- [30 - Local dev](docs/30-local-dev.md)
- [Observability V1](docs/observability.md)
- [00 - System context](docs/00-system-context.md)
- [40 - Observability roadmap](docs/40-observability-roadmap.md)
- [50 - Service onboarding](docs/50-service-onboarding.md)
- [RabbitMQ domain events](docs/rabbitmq.md)
- [Contrat infra analysis-store](docs/contracts/analysis-store/infra/README.md)
- [ADR 0001](docs/adr/0001-infra-source-of-truth.md)
