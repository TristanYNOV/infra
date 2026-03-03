# 30 - Local development

## Prérequis
- Docker Engine + Docker Compose plugin.
- Images `front-service` et `auth-service` disponibles (locales ou registry).

## Configuration
```bash
cp .env.example .env
```

Variables clés à adapter :
- `FRONT_IMAGE`, `AUTH_IMAGE`
- `FRONT_INTERNAL_PORT` (défaut `4200`)
- `AUTH_INTERNAL_PORT` (défaut `3000`)
- `TRAEFIK_WEB_PORT`, `TRAEFIK_DASHBOARD_PORT`

## Démarrage
### 1) Mode core (recommandé)
```bash
make up
```

### 2) Mode core + Watchtower (DEV/staging only)
```bash
make up-watchtower
```

### 3) Mode debug direct auth (localhost)
```bash
make up-direct
```

## URLs utiles
- Front : `http://localhost/`
- Auth via Traefik : `http://localhost/api/auth/...`
- Dashboard Traefik : `http://127.0.0.1:8080/dashboard/`
- Auth direct (mode direct uniquement) : `http://127.0.0.1:${AUTH_HOST_PORT}`

## Commandes utiles
```bash
make ps
make logs
make pull
make restart
make health
make down
```

## Vérification rapide
```bash
curl -i http://localhost/
curl -i http://localhost/api/auth/health
```

En mode direct :
```bash
curl -i http://127.0.0.1:${AUTH_HOST_PORT}/health
```

## Postman
Voir `postman/README.md` pour la stratégie des environnements (Traefik vs direct).
