# 20 - Routing & sécurité

## Règles de routage
- `/` -> `front-service`
- `/api/auth/*` -> `auth-service`
- Middleware `StripPrefix(/api/auth)` appliqué au router auth.

## Pourquoi ce pattern
- Le front et l’API auth partagent le même host (`localhost`) via Traefik.
- Réduction des problèmes CORS en local.
- Convention stable pour futurs services: `/api/<service>`.

## Règles de sécurité locale
- Aucun `ports:` sur `front-service` et `auth-service` en mode normal.
- Dashboard Traefik bindé en loopback uniquement (`127.0.0.1:8080`).
- Le socket Docker est monté en lecture seule pour Traefik et Watchtower.
- Le mode direct auth est explicitement opt-in (fichier override dédié).

## Contrôles recommandés
```bash
make ps
curl -i http://localhost/
curl -i http://localhost/api/auth/health
```
