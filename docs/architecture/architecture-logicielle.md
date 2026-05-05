# Architecture logicielle

## Objectif du document
Décrire l’architecture applicative d’Analyse Basket, ses couches logiques, ses responsabilités métier et ses règles de sécurité.

## Présentation générale
L’architecture logique repose sur un front unique consommant des APIs spécialisées derrière Traefik. Les domaines d’authentification et de stockage métier sont séparés pour isoler les responsabilités et améliorer la maintenabilité.

## Couches applicatives
| Couche | Description | Services impliqués |
|---|---|---|
| Présentation / UI | Interaction utilisateur, rendu SSR, parcours guidés | front-service |
| Authentification | Login, refresh, logout, rôles, identité | auth-service |
| Stockage métier | Timelines, panels, imports, exports, copie, publication | analysis-store-service |
| Infrastructure | Routage, exposition, orchestration des conteneurs | Traefik + Docker Compose |
| Observabilité | Healthchecks, sondes de disponibilité | Uptime Kuma (+ Prometheus/Grafana à compléter) |

## Responsabilités par service
| Service | Responsabilités principales | Frontière de responsabilité |
|---|---|---|
| front-service | UX, appels API, gestion d’état d’interface | N’assure pas la persistance métier durable |
| auth-service | Identité, rôles, sessions, tokens | N’assure pas le stockage métier timelines/panels |
| analysis-store-service | Persistance métier et règles d’ownership | N’assure pas l’authentification primaire |
| infra | Exposition/routage, supervision disponibilité | N’implémente pas la logique métier applicative |

## Communications entre services
1. L’utilisateur interagit avec le front-service.
2. Le front appelle les APIs exposées par Traefik.
3. L’auth-service gère l’émission/validation des tokens et l’état de session.
4. L’analysis-store-service vérifie l’identité transmise et applique les règles d’ownership sur les ressources.

## Domaines fonctionnels couverts
- Analyse vidéo.
- Timelines.
- Panels.
- Events / labels / stats.
- Sauvegarde.
- Publication / copie / export.
- Anonymisation.
- Gestion de session.

## Maintenabilité
- Séparation front/backend pour isoler les cycles d’évolution.
- Services indépendants (front/auth/analysis-store) pour réduire les impacts croisés.
- Contrats API documentés et versionnables.
- Structuration backend attendue autour de DTO, guards et services.
- CI/CD gérée par dépôt pour tracer builds et releases.

## Sécurité logique
- Authentification centralisée par auth-service.
- Gestion de rôles utilisateur/admin.
- Ownership des ressources métier côté analysis-store-service.
- Refresh token opaque en cookie HttpOnly.
- Séparation des bases MongoDB (auth) et PostgreSQL (métier).
- Validation des entrées côté backend avant persistance.

## Extensibilité
- Ajout de nouveaux services métier derrière Traefik.
- Future propagation d’événements interservices pour certains flux.
- Monitoring enrichi (métriques détaillées, alerting avancé).
- Ajout de modules d’analyse supplémentaires.

## À compléter
- Stratégie de versionnement formelle des contrats API.
- Niveau exact de couverture des tests d’intégration interservices.
