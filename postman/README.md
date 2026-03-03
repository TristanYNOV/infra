# Postman (stratégie d’environnements)

Les collections/JSON Postman sont maintenus dans le repo `auth-service`.
Dans `infra`, on documente uniquement la stratégie d’usage local.

## Environnement 1 : via Traefik (par défaut)
- `baseUrl = http://localhost`
- Exemple : `{{baseUrl}}/api/auth/login`

Usage recommandé pour tests d’intégration (comportement proche du front).

## Environnement 2 : direct auth (debug)
- `baseUrl = http://127.0.0.1:${AUTH_HOST_PORT}`
- Exemple : `{{baseUrl}}/login`

Nécessite le mode direct :
```bash
make up-direct
```

## Règle simple
- Intégration : utiliser Traefik.
- Debug ciblé auth : utiliser direct.
