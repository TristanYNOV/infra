# Qualité de code

## Objectif du document
Définir les pratiques qualité appliquées au développement d’Analyse Basket et les améliorations à engager.

## Principes qualité
- Lisibilité, maintenabilité, séparation des responsabilités.
- Cohérence des conventions par repo.
- Validation continue via lint/tests/build.
- Documentation technique associée aux contrats et flux.

## Conventions front
- TypeScript fortement utilisé.
- Angular standalone components.
- Usage de `inject()` quand pertinent.
- Usage de `signals`/`computed` quand pertinent.
- Tailwind pour layout/spacing/flex/grid/responsive.
- Éviter l’usage direct de couleurs Tailwind dans les templates.
- Centraliser les couleurs via variables SCSS.
- Limiter le SCSS composant aux overrides nécessaires.

## Conventions backend
- NestJS structuré en modules/controllers/services.
- DTO et validation des entrées.
- Séparation claire des responsabilités.
- Contrats API documentés.

## Conventions infra
- Déploiement contrôlé via repo `infra`.
- Vérification healthchecks et disponibilité après livraison.
- Références images versionnées (SemVer + digest).

## Versioning
- Tags et versions en SemVer.

## Documentation
- Documentation centralisée dans `docs/` pour architecture, cadrage, dev, exploitation.

## Tableau de synthèse
| Domaine | Pratique | Objectif | Statut | Amélioration prévue |
|---|---|---|---|---|
| Langage | TypeScript dominant | Réduire erreurs et améliorer maintenabilité | En place | Renforcer typage strict si besoin |
| Front Angular | Standalone + `inject()` + signals/computed | Code modulaire et moderne | En place | Harmoniser patterns par feature |
| Styling | Tailwind structurel + couleurs SCSS centralisées | Cohérence visuelle et maintenance | En place | Formaliser conventions CSS par repo |
| Backend NestJS | Modules/controllers/services + DTO validation | Séparation responsabilités + robustesse | En place | Revue systématique des contrats API |
| CI qualité | Lint/tests/build | Détection précoce de régressions | En place | Statuts bloquants à expliciter partout |
| Versioning | SemVer | Traçabilité versions | En place | Ajouter convention de release notes |
| Formatage | Prettier | Uniformité de style | Non en place | Étudier adoption progressive |
| Commits | Règles commits | Historique lisible | Non formalisé | Définir convention (ex: Conventional Commits) |
| Lint | ESLint | Hygiène de code | Partiellement précisé | Documenter règles par repo |
| Qualité sécurité | Audit dépendances/scan images | Réduction surface de risque | À renforcer | Intégrer audit et scans automatisés |

## Limites actuelles
- Pas de Prettier standardisé.
- Règles de commit non formalisées.
- Règles ESLint détaillées non consolidées inter-repos.

## Améliorations prévues
- Formaliser conventions de commit et revue.
- Suivre couverture de tests par repo.
- Intégrer audit dépendances et scan images.
- Renforcer revue qualité technique régulière.

## À compléter
- Politique exacte de revue de code (critères, seuils, approbations).
