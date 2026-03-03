# infra

## What / Why
`infra` est le repo de coordination inter-services pour la plateforme d’analyse vidéo sportive.
Il centralise:
- le contexte système global,
- les conventions d’architecture et de routage,
- l’orchestration locale via Docker Compose,
- les points d’entrée dev/test (navigateur, curl, Postman).

Objectif: faire de ce repo la **source de vérité** pour aligner `front-service`, `auth-service` et les futurs services.

## Démarrage rapide
1. Copier la configuration d’environnement:
   ```bash
   cp .env.example .env
   ```
2. Adapter les images/tags si nécessaire dans `.env`.
3. Démarrer le stack core:
   ```bash
   make up
   ```
4. Vérifier l’état:
   ```bash
   make ps
   make health
   ```

## URLs principales
- Front (via Traefik): `http://localhost/`
- Auth API (via Traefik): `http://localhost/api/auth/*`
- Dashboard Traefik (dev, localhost seulement): `http://127.0.0.1:${TRAEFIK_DASHBOARD_PORT}`

## Modes d’exécution
- **Core (par défaut)**: exposition hôte uniquement via Traefik.
- **Direct debug (optionnel)**: expose `auth-service` sur `127.0.0.1` via override Compose.

```bash
make up-direct
```

## Troubleshooting rapide
- **CORS en front**: vérifier que le front appelle `/api/auth/...` (même host Traefik) et pas un host direct.
- **404 sur `/api/auth/...`**: vérifier le router `auth` + middleware `stripPrefix` côté labels Traefik.
- **Conflit de ports**: vérifier `TRAEFIK_WEB_PORT`, `TRAEFIK_DASHBOARD_PORT`, `AUTH_HOST_PORT` dans `.env`.
- **Service non joignable**: `make logs` puis vérifier l’endpoint de health du service.

## Documentation
- [00-system-context](docs/00-system-context.md)
- [10-architecture](docs/10-architecture.md)
- [20-routing-security](docs/20-routing-security.md)
- [30-local-dev](docs/30-local-dev.md)
- [40-observability-roadmap](docs/40-observability-roadmap.md)
- [50-service-onboarding](docs/50-service-onboarding.md)
- [ADR 0001](docs/adr/0001-repo-infra-as-source-of-truth.md)
- [Postman guide](postman/README.md)
