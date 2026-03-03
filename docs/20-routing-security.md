# 20 - Routing & sécurité

## Routage Traefik (DEV/local)
- `/` -> `front-service`
- `/api/auth/*` -> `auth-service`
- Middleware `StripPrefix(/api/auth)` appliqué au router auth.
- Convention future standardisée : `/api/<service>/*`.

## Pourquoi ce choix
- Un point d’entrée unique simplifie le modèle réseau.
- Le front consomme les APIs via le même host (`localhost`) ; CORS simplifié en local.
- Les règles de routing deviennent homogènes pour tous les futurs services.

## Règles de sécurité locales (core)
1. Traefik est le seul service avec `ports:` publiés.
2. `front-service` et `auth-service` restent internes au réseau Docker.
3. Dashboard Traefik exposé uniquement en loopback (`127.0.0.1:8080`).
4. `providers.docker.exposedByDefault=false` (opt-in explicite via labels).
5. Socket Docker monté en lecture seule pour Traefik et Watchtower.

## Mode debug direct auth
- Le fichier `docker-compose.direct.yml` expose `auth-service` sur `127.0.0.1:${AUTH_HOST_PORT}`.
- Ce mode est volontairement séparé du mode core.
- À utiliser pour debug ciblé uniquement.

## JWT et évolution sécurité
- V1 actuelle : Traefik fait uniquement du routage.
- Étape suivante prévue : ajout d’un mécanisme de vérification JWT au niveau gateway.
- Cette évolution doit préserver le découplage du `auth-service` (MVP auth sans logique métier avancée).

## Contrôles recommandés
```bash
make ps
curl -i http://localhost/
curl -i http://localhost/api/auth/health
```
