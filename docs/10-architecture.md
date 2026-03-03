# 10 - Architecture

## Vue d’ensemble
Architecture locale orientée gateway:

```text
[ Browser / Postman / curl ]
              |
              v
      +-------------------+
      |      Traefik      |
      |   (entrypoint)    |
      +-------------------+
         |             |
         |             |
         v             v
 +---------------+  +----------------+
 | front-service |  |  auth-service  |
 |   (Angular)   |  |   (JWT API)    |
 +---------------+  +----------------+
```

## Flux HTTP
- `GET /` et routes front: Traefik -> `front-service`.
- `/*` front non API: Traefik -> `front-service`.
- `/api/auth/*`: Traefik -> middleware `StripPrefix(/api/auth)` -> `auth-service`.

## Responsabilités
- **infra repo**
  - conventions globales,
  - routage cross-service,
  - orchestration locale.
- **front-service repo**
  - build/run Angular,
  - logique UI.
- **auth-service repo**
  - contrats API auth,
  - logique JWT/metiers auth.

## Règles de séparation
1. Pas de logique métier dans `infra`.
2. Pas de dépendance front -> auth en accès direct host par défaut.
3. Toute nouvelle API doit être routée via un préfixe `/api/<service>`.
4. Les variables runtime (images/ports) sont pilotées via `.env`.

## Réseaux Docker (local)
- Un réseau `edge` commun entre Traefik et les services routés.
- Aucun port hôte publié pour `front-service` et `auth-service` dans le mode standard.
