# 30 - Local development

## Pré-requis
- Docker + Docker Compose plugin
- GNU Make (si utilisation du `Makefile`)

## Configuration
1. Copier les variables:
   ```bash
   cp .env.example .env
   ```
2. Renseigner les images réelles (`FRONT_IMAGE`, `AUTH_IMAGE`) et adapter les tags si besoin.

## Modes Compose

### Mode core (par défaut)
Expose seulement Traefik sur l’hôte.

```bash
make up
make ps
make logs
```

### Mode direct debug (auth sans Traefik)
Ajoute une publication locale pour `auth-service`.

```bash
make up-direct
```

> Ce mode est réservé au debug local/Postman ciblé. Ne pas l’utiliser comme mode standard d’intégration front.

## Tests rapides

### Via Traefik (mode standard)
```bash
curl -i http://localhost:${TRAEFIK_WEB_PORT:-80}/
curl -i http://localhost:${TRAEFIK_WEB_PORT:-80}/api/auth/health
```

### Direct (mode debug)
```bash
curl -i http://127.0.0.1:${AUTH_HOST_PORT}/health
```

## Commandes utiles
- `make up` / `make down`
- `make up-direct`
- `make logs`
- `make ps`
- `make health`

## Notes Postman
Voir [postman/README.md](../postman/README.md) pour la stratégie d’environnements “via Traefik” vs “direct debug”.
