# Architecture infrastructure

## Objectif du document
Décrire l’architecture d’infrastructure déployée via le dépôt `infra` : orchestration, routage, connectivité, images et supervision.

## Rôle du repo infra
Le dépôt `infra` centralise la configuration d’orchestration Docker Compose, la configuration Traefik, les variables d’images GHCR, les mécanismes de monitoring de disponibilité et la cohérence d’exposition HTTP des services.

## Schéma d’infrastructure (texte)
```txt
[Internet / Navigateur]
          |
          v
      [Traefik]
          |
          +-- "/" ------------------------> front-service:4000
          |
          +-- "/auth", "/users", "/me" ---> auth-service:3000
          |
          +-- "/analysis" -- strip prefix -> analysis-store-service:3001
                                             |
                                             +--> PostgreSQL

auth-service:3000
    |
    +--> MongoDB
```

## Docker Compose : composants
- **Services applicatifs** : front-service, auth-service, analysis-store-service.
- **Services base de données** : MongoDB (auth), PostgreSQL (analysis-store).
- **Reverse proxy** : Traefik pour exposition HTTP unifiée.
- **Monitoring** : Uptime Kuma pour disponibilité ; Prometheus/Grafana à compléter selon état réel.

## Traefik : principes de configuration
- Fournisseur Docker (découverte via labels).
- Routage HTTP piloté par labels de service.
- Routage par préfixe de chemin.
- Pour analysis-store : route `/analysis` avec suppression du préfixe (`strip prefix`) avant appel interne.
- Dashboard Traefik : ne pas exposer publiquement en production.

## Réseaux Docker
- Réseau proxy : interconnexion Traefik <-> services exposés.
- Réseaux internes de données : accès restreint services applicatifs <-> bases.
- Détail exact des noms de réseaux : À compléter.

## Variables d’image
| Variable | Usage |
|---|---|
| `FRONT_IMAGE` | Référence image front-service |
| `AUTH_IMAGE` | Référence image auth-service |
| `ANALYSIS_STORE_IMAGE` | Référence image analysis-store-service |

Recommandation : privilégier des références immuables par digest (`image@sha256:...`) pour les déploiements de production.

## Healthchecks
- front-service : `/healthz`
- auth-service : `/health`
- analysis-store-service : `/api/health`
- sondes de supervision Uptime Kuma alignées sur ces endpoints.

## Flux HTTP en production
| URL publique | Service cible | Transformation éventuelle | Endpoint interne |
|---|---|---|---|
| `/` | front-service | Aucune | `front-service:4000/` |
| `/auth/...` | auth-service | Aucune | `auth-service:3000/auth/...` |
| `/users/...` | auth-service | Aucune | `auth-service:3000/users/...` |
| `/me/...` | auth-service | Aucune | `auth-service:3000/me/...` |
| `/health` | auth-service | Aucune | `auth-service:3000/health` |
| `/analysis/api/...` | analysis-store-service | Suppression du préfixe `/analysis` | `analysis-store-service:3001/api/...` |

## Points de vigilance
- Priorité des routes Traefik pour éviter les collisions avec la route front (`/`).
- Ne pas exposer directement MongoDB/PostgreSQL hors réseau interne.
- Conserver une cohérence stricte des préfixes API entre front et production.
- Gérer les secrets via `.env` et politiques d’accès adaptées.
- Maintenir un monitoring actif de disponibilité.

## À compléter
- Noms exacts des réseaux Docker utilisés en production.
- Politique de rotation des secrets et des credentials base de données.
