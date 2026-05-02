# 20 - Routing & sécurité

## Routage Traefik (DEV/local V1)
- `/auth` -> `auth-service`
- `/users` -> `auth-service`
- `/me` -> `auth-service`
- `/health` -> `auth-service` (health endpoint)
- `/analysis` -> `analysis-store-service` (middleware strip-prefix `/analysis`)
- `/` (et tout le reste) -> `front-service`

`analysis-store-service` applique un `StripPrefix` sur `/analysis` pour conserver des routes backend internes en `/api/...`.

Note: le contrat importé `auth-service` mentionne encore `/api/auth` + `StripPrefix`; la V1 locale de ce repo applique les routes relatives déjà utilisées par `front-service` (`/auth`, `/users`, `/me`).

Exemple de flux analysis:
- requête publique: `/analysis/api/panels`
- requête backend reçue: `/api/panels`

Chaîne gateway pour analysis:
1. suppression des headers `x-auth-user-id`, `x-auth-club-ids`, `x-auth-roles` provenant du client
2. validation du JWT via middleware Traefik `forwardAuth` vers l’endpoint interne `auth-service` `GET /internal/auth/context`, avec transmission explicite du header `Authorization`
3. propagation vers `analysis-store-service` uniquement des headers d'identité renvoyés par `forwardAuth`
4. `x-auth-club-ids` reste listé côté propagation même s’il n’est pas encore renvoyé actuellement par `auth-service` (compatibilité future)

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
- Traefik fait uniquement du reverse proxy pour la stack actuellement active par défaut.
- Pas de validation JWT au niveau gateway pour cette V1 par défaut.
- La sécurité applicative JWT reste gérée par `auth-service`.

## Contrat identité interne (`analysis-store-service`)
Le contrat `analysis-store` attend des headers internes injectés après validation JWT en gateway :
- `x-auth-user-id`
- `x-auth-club-ids`
- `x-auth-roles`

Ces headers ne doivent jamais être pris depuis le client public; la gateway les fixe après validation JWT.

## Contrôles recommandés
```bash
make ps
curl -i http://localhost/
curl -i http://localhost/health
curl -i http://localhost/auth/login
```
