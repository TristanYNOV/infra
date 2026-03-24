# infra

Repository d’infrastructure pour l’application web d’analyse vidéo sportive.

Ce repo est la **source de vérité** pour :
- l’orchestration locale Docker Compose,
- les conventions de routage Traefik,
- la consommation d’images privées GHCR publiées par les repos applicatifs.

## Contrats de référence (importés)
La stack locale V1 s’appuie explicitement sur :
- `docs/contracts/auth-service/infra/INFRA_CONTRACT.md`
- `docs/contracts/front-service/deployment/README.md`
- `docs/contracts/front-service/deployment/reverse-proxy.md`
- `docs/contracts/front-service/deployment/runtime-env.example`

## Architecture V1 locale
- `traefik` = unique point d’entrée HTTP (`http://localhost`).
- `front-service` (SSR Angular) servi derrière Traefik sur son **port conteneur 4000**.
- `auth-service` servi derrière Traefik sur son **port conteneur 3000**.
- `mongo` interne Docker uniquement (pas d’exposition port hôte par défaut).

## Routage Traefik
- `/auth`, `/users`, `/me`, `/health` -> `auth-service`
- tout le reste (`/`, pages SSR, assets) -> `front-service`

## Quickstart local
```bash
cp .env.example .env
# remplir les variables sensibles (JWT/admin) + images GHCR

docker login ghcr.io

make pull
make up
make ps
make health
```

## URLs locales
- App via Traefik : `http://localhost/`
- Dashboard Traefik (loopback) : `http://127.0.0.1:8080/dashboard/`

## Mise à jour de version d’un service
1. Récupérer le digest publié dans le workflow applicatif (`sha256:...`).
2. Mettre à jour `FRONT_IMAGE` ou `AUTH_IMAGE` dans `.env` avec `ghcr.io/...@sha256:...`.
3. Relancer :
   ```bash
   make pull
   make up
   ```

## Documentation
- [10 - Architecture](docs/10-architecture.md)
- [20 - Routing & sécurité](docs/20-routing-security.md)
- [30 - Local dev](docs/30-local-dev.md)
- [00 - System context](docs/00-system-context.md)
- [40 - Observability roadmap](docs/40-observability-roadmap.md)
- [50 - Service onboarding](docs/50-service-onboarding.md)
- [ADR 0001](docs/adr/0001-infra-source-of-truth.md)
