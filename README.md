# infra

Repository d’infrastructure pour l’application web d’analyse vidéo sportive.

Ce repo est la **source de vérité** pour :
- le contexte système global,
- l’orchestration Docker (local/dev),
- les conventions inter-services (routing, sécurité, onboarding).

## Contexte rapide
- Produit : application d’analyse vidéo sportive.
- Application principale côté client : `front-service` (Angular : timeline, séquenceur, lecture vidéo navigateur).
- Architecture cible : microservices, **1 repo par service**.
- Services actuels :
  - `front-service`
  - `auth-service` (inscription, connexion, émission JWT)
- Service prévu :
  - `export-service` (export/sauvegarde JSON timeline/séquenceur)

## Principe réseau/sécurité (local)
- Traefik est l’unique point d’entrée HTTP.
- Le navigateur ne parle qu’à Traefik.
- `front-service` et `auth-service` n’exposent pas de ports hôte en mode normal.
- Dashboard Traefik : loopback uniquement (`127.0.0.1`).

## Quickstart
```bash
cp .env.example .env
make up
make ps
make health
```

## URLs locales
- Front via Traefik : `http://localhost/`
- Auth via Traefik : `http://localhost/api/auth/...`
- Dashboard Traefik (dev local) : `http://127.0.0.1:8080/dashboard/`

## Modes d’exécution
- **Core (recommandé)** : exposition HTTP via Traefik uniquement.
  ```bash
  make up
  ```
- **Core + Watchtower (DEV/staging only)** : auto-pull/restart des services labellisés.
  ```bash
  make up-watchtower
  ```
- **Debug direct auth (optionnel)** : expose auth en localhost via override.
  ```bash
  make up-direct
  ```

## Documentation
- [00 - System context](docs/00-system-context.md)
- [10 - Architecture](docs/10-architecture.md)
- [20 - Routing & sécurité](docs/20-routing-security.md)
- [30 - Local dev](docs/30-local-dev.md)
- [35 - Déploiement DEV/staging Watchtower](docs/35-deployment-dev-watchtower.md)
- [40 - Observability roadmap](docs/40-observability-roadmap.md)
- [50 - Service onboarding](docs/50-service-onboarding.md)
- [ADR 0001](docs/adr/0001-infra-source-of-truth.md)
- [Postman strategy](postman/README.md)
