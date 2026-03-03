# 20 - Routing & security conventions

## Routes cibles
- `/` -> `front-service`
- `/api/auth/*` -> `auth-service` avec `StripPrefix(/api/auth)`

## Priorité des routers Traefik
Convention recommandée:
- Router `auth`: priorité haute (ex: `200`) pour matcher `/api/auth` avant le catch-all front.
- Router `front`: priorité plus basse (ex: `100`) avec `PathPrefix(`/`)`.

Cette stratégie évite que `/api/auth/*` soit capturé par le router front.

## Convention de basepath API
Tout nouveau service backend doit exposer ses endpoints derrière:
- `/api/<service>` côté Traefik,
- puis être réécrit (StripPrefix) vers le port interne du service.

Exemple générique:
- entrée client: `/api/video/jobs`
- après strip: `/jobs` sur `video-service`.

## Sécurité dev minimale
- Par défaut, seul Traefik publie des ports sur l’hôte.
- Le dashboard Traefik est autorisé en dev uniquement sur `127.0.0.1`.
- L’exposition directe de `auth-service` existe uniquement dans `docker-compose.direct.yml` (debug explicite).

## TODO sécurité (étape suivante)
- Ajouter un middleware/forward auth JWT au niveau gateway pour les routes protégées.
- Définir une politique standard routes publiques vs routes privées.
- Ajouter des tests d’intégration “gateway enforces auth”.
