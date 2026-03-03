# 00 - System context

## Contexte
Le projet d’analyse vidéo est basé sur des microservices. À ce stade, deux services applicatifs existent :
- `front-service` (Angular),
- `auth-service` (JWT).

## Objectif de cette base infra
Créer un environnement local simple, reproductible et sécurisé où :
- Traefik est l’unique entrée HTTP,
- les services internes ne publient pas de ports hôte en mode normal,
- les conventions d’équipe sont explicites.

## Invariants
1. `infra` est la source de vérité pour l’orchestration locale.
2. Les appels client passent via Traefik.
3. Le routage auth se fait sous `/api/auth/*`.
4. Le debug direct est un mode explicite, séparé du mode normal.

## Périmètre de cette étape
- Orchestration Docker Compose locale.
- Routage Traefik pour front + auth.
- Documentation d’onboarding.
- Option Watchtower pour DEV/staging.

## Hors périmètre
- Hardening production.
- Observabilité complète (implémentation).
- Monitoring niveau 1/2 (uniquement roadmap documentaire).
