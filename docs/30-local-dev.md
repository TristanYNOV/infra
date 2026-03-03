# 30 - Local development

## Prérequis
- Docker + Docker Compose plugin.
- Images `front-service` et `auth-service` accessibles localement/registry.

## Setup
```bash
cp .env.example .env
```

Adapter si nécessaire :
- `FRONT_IMAGE`, `AUTH_IMAGE`
- `FRONT_INTERNAL_PORT` (défaut `4200`)
- `AUTH_INTERNAL_PORT` (défaut `3000`)

## Démarrage
### Mode core
```bash
make up
```

### Mode core + Watchtower (DEV/staging)
```bash
make up-watchtower
```

### Mode debug direct auth
```bash
make up-direct
```

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

En mode direct:
```bash
curl -i http://127.0.0.1:${AUTH_HOST_PORT}/health
```
