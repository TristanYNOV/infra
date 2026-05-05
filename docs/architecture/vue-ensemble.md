# Vue d’ensemble

## Objectif du document
Présenter les composants majeurs et leurs interactions.

## Diagramme de contexte
```mermaid
graph LR
U[Utilisateur]-->F[front-service Angular SSR]
F-->A[auth-service NestJS]
F-->S[analysis-store-service NestJS]
A-->M[(MongoDB)]
S-->P[(PostgreSQL)]
T[Traefik]-->F
T-->A
T-->S
```

## Services
- `front-service` : UI SSR, port interne 4000, healthcheck `/healthz`.
- `auth-service` : auth JWT/refresh + rôles, MongoDB, healthcheck `/health`.
- `analysis-store-service` : timelines/panels via `/api/...`, PostgreSQL, healthcheck `/api/health`, exposition `/analysis`.
- `infra` : Docker Compose, Traefik, GHCR, Uptime Kuma.
