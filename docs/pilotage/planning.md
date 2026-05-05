# Planning

## Objectif du document
Présenter le planning macro, les charges approximatives investies, les jalons et dépendances du projet Analyse Basket.

## Hypothèses de planning
- Projet mené principalement par le porteur du projet.
- Réalisation en parallèle des études, activité professionnelle et vie personnelle.
- Durées exprimées en charges approximatives, non contractuelles.

## Découpage par phases
- Cadrage et conception initiale
- Développement front
- Développement auth
- Développement analysis-store
- Construction infra
- Industrialisation CI/CD
- Monitoring
- Documentation
- Stabilisation et corrections

## Planning macro
| Phase | Objectif | Période ou date | Durée approximative | Livrables | Dépendances | Statut | Commentaire |
|---|---|---|---|---|---|---|---|
| Cadrage/conception initiale | Définir besoin et cible MVP | À compléter | À compléter | Vision produit, périmètre MVP | Aucune | Réalisé en grande partie | Cadre ajusté progressivement |
| front-service | Construire UX et analyse vidéo | À compléter | ~5 mois | Front Angular SSR fonctionnel | Cadrage initial | En place | Première brique majeure |
| auth-service | Authentification et sessions | À compléter | ~2 mois | Login/refresh/logout/rôles | Front partiellement prêt | En place | Socle sécurité |
| analysis-store-service | Sauvegarde timelines/panels | À compléter | ~2 mois | CRUD métier, persistance | Auth + front | En place | Cœur stockage métier |
| infra Docker/Traefik | Orchestration et routage | À compléter | ~3 mois | Compose, Traefik, services reliés | Services applicatifs | En place | Déploiement contrôlé |
| CI/CD | Publier images GHCR | À compléter | ~1 mois | Pipelines build/test/publish | Repos applicatifs | En place | Selon règles repo |
| Monitoring | Disponibilité des services | À compléter | ~2 semaines | Uptime Kuma intégré | Infra | En place | Prom/Graf en cours/prévu |
| Documentation | Structurer la connaissance | À compléter | ~2 semaines | Base documentaire `docs/` | Ensemble du projet | En cours | À maintenir dans le temps |
| Stabilisation/corrections | Réduire anomalies | En continu | Continu | Correctifs et fiabilisation | Toutes phases | En cours | Fil rouge projet |

## Charges approximatives
- Front : ~5 mois
- Auth : ~2 mois
- Analysis-store : ~2 mois
- Infra : ~3 mois
- CI/CD : ~1 mois
- Monitoring : ~2 semaines
- Documentation : ~2 semaines
- Debug/corrections : continu

## Jalons principaux
- Première version fonctionnelle du front.
- Authentification opérationnelle.
- Sauvegarde timelines/panels.
- Intégration analysis-store.
- Dockerisation infra.
- Publication GHCR.
- Intégration Uptime Kuma.
- Préparation Prometheus/Grafana.
- Documentation projet.
- Recette MVP.

## Dépendances entre lots
- L’auth est prerequisite pour sécuriser certains flux analysis-store.
- L’infra dépend de la disponibilité des images applicatives.
- Le monitoring dépend de services stables et routables.
- La recette finale dépend de la cohérence inter-repos.

## Retards ou ajustements
- Ajustements réguliers liés aux contraintes de temps et à l’apprentissage technique.
- Repriorisation selon anomalies critiques et exigences MVP.

## Informations à compléter
- Dates exactes de jalons.
- Cadence cible de livraison par lot.
