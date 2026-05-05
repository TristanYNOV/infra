# Ressources

## Objectif du document
Documenter les ressources mobilisées pour le pilotage, la réalisation et l’exploitation du projet Analyse Basket.

## Ressources humaines
Le projet est réalisé seul ; le porteur du projet couvre la majorité des responsabilités (cadrage, développement, tests, infra, exploitation, documentation).

### Tableau — ressources humaines
| Ressource | Rôle / responsabilité | Niveau d’implication | Commentaire |
|---|---|---|---|
| Porteur du projet | Cadrage, conception, dev, tests, infra, exploitation, maintenance, documentation | Très fort | Rôle central et cumul de responsabilités |
| Collègues/amis techniques | Échanges ponctuels, challenge technique | Ponctuel | Support consultatif |
| Clubs témoins futurs | Validation métier terrain | À venir | Non formalisé à ce stade |
| Utilisateurs cibles futurs | Feedback produit | À venir | Coachs/analystes/staps/formateurs |

## Ressources techniques
### Tableau — ressources techniques
| Ressource | Usage | Statut |
|---|---|---|
| Mac et Windows | Développement local | En place |
| WebStorm / VS Code | IDE | En place |
| Node `>=22`, npm `>=10` | Runtime JS/TS | En place |
| Docker / Docker Compose | Exécution et intégration | En place |
| Git / GitHub | Versioning et collaboration | En place |
| GHCR | Registre d’images | En place |
| Traefik | Reverse proxy | En place |
| Uptime Kuma | Monitoring disponibilité | En place |
| Prometheus / Grafana | Monitoring avancé | Prévu/en cours |
| MongoDB | Persistance auth | En place |
| PostgreSQL | Persistance analysis-store | En place |

## Ressources logicielles
- Angular SSR (front-service)
- NestJS (auth-service, analysis-store-service)
- Outils tests et CI/CD selon repos
- Documentation `docs/` comme base de transfert de connaissance

## Ressources infrastructure
- Orchestration via repo `infra`.
- Déploiement contrôlé manuel avec images GHCR.
- Routage Traefik et supervision disponibilité.

## Ressources financières
Budget limité, orienté sobriété des coûts.

### Tableau — ressources financières
| Poste | Orientation | Statut |
|---|---|---|
| Développement | Temps investi du porteur | En cours |
| Hébergement | Solution peu coûteuse, idéalement Europe | À compléter |
| Base de données | Coût à optimiser | À compléter |
| Stockage vidéo | Non activé par défaut pour limiter coûts | En place |
| Monitoring | Démarrage léger (Uptime), extension progressive | En cours |

## Ressources documentaires
- Documentation centralisée dans `docs/`.
- Templates/checklists pour exploitation, recette et suivi.

## Contraintes
- Ressource humaine unique (risque de charge).
- Arbitrage constant entre qualité, délai et périmètre.
- Besoin de maintenir une cohérence inter-repos.

## Informations à compléter
- Coûts d’hébergement détaillés.
- Capacité budgétaire mensuelle cible.
