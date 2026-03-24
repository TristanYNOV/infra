# 20 - Routing & sécurité

## Routage Traefik (DEV/local V1)
- `/auth` -> `auth-service`
- `/users` -> `auth-service`
- `/me` -> `auth-service`
- `/health` -> `auth-service` (health endpoint)
- `/` (et tout le reste) -> `front-service`

Aucun `StripPrefix` n’est appliqué : les routes sont forwardées telles quelles.

Note: le contrat importé `auth-service` mentionne encore `/api/auth` + `StripPrefix`; la V1 locale de ce repo applique les routes relatives déjà utilisées par `front-service` (`/auth`, `/users`, `/me`).

## Pourquoi ce choix
- Le front consomme déjà des chemins relatifs en production (`/auth/login`, `/users`, `/auth/refresh`, `/auth/logout`, `/me`).
- Même origine (`localhost`) => modèle réseau simple et CORS évité en local.
- Contrat reverse proxy front respecté (SSR et deep-link forwardés sans transformation).

## Règles de sécurité locales
1. Traefik est le seul service avec `ports:` publiés.
2. `front-service`, `auth-service` et `mongo` restent privés sur le réseau Docker.
3. Dashboard Traefik exposé uniquement en loopback (`127.0.0.1:8080`).
4. `providers.docker.exposedByDefault=false` (opt-in via labels).
5. Socket Docker montée en lecture seule pour Traefik.
6. Mongo n’est pas publié vers l’hôte.

## JWT (périmètre V1)
- Traefik fait uniquement du reverse proxy.
- Pas de validation JWT au niveau gateway pour cette V1.
- La sécurité applicative JWT reste gérée par `auth-service`.

## Contrôles recommandés
```bash
make ps
curl -i http://localhost/
curl -i http://localhost/health
curl -i http://localhost/auth/login
```
