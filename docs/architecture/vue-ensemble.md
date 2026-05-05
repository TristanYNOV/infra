# Vue d’ensemble

## Objectif du document
Présenter une vision synthétique de l’application Analyse Basket, des services en place et de leurs responsabilités.

## Vue synthétique de l’application
Analyse Basket s’appuie sur une architecture orientée services : un front Angular SSR pour l’expérience utilisateur, un service d’authentification dédié, un service de stockage métier dédié aux timelines/panels, et une couche infrastructure qui orchestre l’exposition et la supervision.

## Schéma global (texte)
```txt
Utilisateur
   |
   v
Traefik
   |
   +--> front-service : Angular SSR, UI, landing page, analyse vidéo
   |
   +--> auth-service : NestJS, login, refresh, logout, sessions, rôles
   |        |
   |        +--> MongoDB
   |
   +--> analysis-store-service : NestJS, timelines, panels, exports, copies
            |
            +--> PostgreSQL
```

## Tableau des composants
| Composant | Rôle | Technologie | Données manipulées | Dépendances principales | Healthcheck |
|---|---|---|---|---|---|
| front-service | Interface utilisateur, rendu SSR, parcours analyse vidéo | Angular SSR | État UI, données d’affichage, access token en mémoire applicative (à confirmer) | Traefik, auth-service, analysis-store-service | `/healthz` |
| auth-service | Authentification, sessions, rôles utilisateur/admin | NestJS + MongoDB | Comptes, sessions, rôles, refresh token opaque (session) | MongoDB, Traefik | `/health` |
| analysis-store-service | Stockage métier timelines/panels, export/copie/publication | NestJS + PostgreSQL | Timelines, panels, métadonnées, états de publication/anonymisation | PostgreSQL, Traefik | `/api/health` |
| infra | Orchestration, routage, images, monitoring disponibilité | Docker Compose, Traefik, GHCR, Uptime Kuma | Configuration de services, tags/digests d’images, états de sondes | Registre GHCR, réseau Docker | À compléter |

## Responsabilités
- Le **front-service** ne stocke pas durablement les données métier ; il orchestre les interactions utilisateur et les appels API.
- L’**auth-service** gère l’identité, les sessions, les rôles et les mécanismes de token.
- L’**analysis-store-service** gère la persistance métier (timelines/panels) et les opérations associées (copy/export/publication/anonymisation).
- L’**infra** orchestre l’exposition des services, le routage HTTP, la gestion des images et le monitoring de disponibilité.

## Principes d’architecture
- Séparation claire des responsabilités par service.
- Services spécialisés pour limiter le couplage fonctionnel.
- Persistance métier assurée côté backends.
- Exposition centralisée via Traefik.
- Services observables via healthchecks.
- Images Docker versionnées et déployées via GHCR.

## Limites et évolutions prévues
- Chaîne métrique Prometheus/Grafana : à finaliser selon l’état réel d’intégration.
- La documentation doit être mise à jour à chaque ajout ou retrait de service.
- Une gestion événementielle interservices est prévue pour certains flux (notamment suppression utilisateur progressive).

## À compléter
- Politique exacte de stockage de l’access token côté front.
- Cartographie détaillée des métriques techniques exposées.
