# infra

Repo d’infrastructure locale pour la plateforme d’analyse vidéo (microservices).

## But du repo
`infra` est la source de vérité pour :
- l’orchestration Docker Compose,
- les conventions de routage/sécurité,
- la documentation d’équipe pour le run local.

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
- Dashboard Traefik (local uniquement) : `http://127.0.0.1:8080/dashboard/`

## Modes d’exécution
- **Core (recommandé)** : seul Traefik publie des ports.
  ```bash
  make up
  ```
- **Debug direct auth (optionnel)** : expose `auth-service` en localhost via override.
  ```bash
  make up-direct
  ```

## Watchtower (Option 1, DEV/staging)
Watchtower est **optionnel** et réservé DEV/staging pour auto-pull + restart des services applicatifs quand leurs images changent.

- Activer :
  ```bash
  make up-watchtower
  ```
- Désactiver (retour mode core) :
  ```bash
  make down
  make up
  ```
- Limites : nécessite l’accès Docker socket; non recommandé en production.

## Documentation
- [System context](docs/00-system-context.md)
- [Architecture](docs/10-architecture.md)
- [Routing & sécurité](docs/20-routing-security.md)
- [Local dev](docs/30-local-dev.md)
- [Déploiement DEV avec Watchtower](docs/35-deployment-dev-watchtower.md)
- [Roadmap observabilité](docs/40-observability-roadmap.md)
- [Onboarding service](docs/50-service-onboarding.md)
- [ADR 0001](docs/adr/0001-infra-source-of-truth.md)
- [Postman](postman/README.md)
