# Intégration continue

## Objectif du document
Décrire le fonctionnement de l’intégration continue sur les repos applicatifs d’Analyse Basket.

## Définition dans le contexte Analyse Basket
L’intégration continue vise à valider automatiquement la qualité minimale du code (lint, tests, build), puis à industrialiser la production d’images Docker publiées sur GHCR selon les règles de chaque repo.

## Repos concernés
- `front-service`
- `auth-service`
- `analysis-store-service`

Le repo `infra` ne porte pas de CI/CD applicative à ce stade.

## Déclencheurs
- Push sur `dev` et `prod`.
- Pull request sur `dev` et `prod`.
- Tags SemVer selon règles propres à chaque repo.

## Étapes de workflow
- Lint
- Tests
- Build
- Docker build
- Publication GHCR

## Tableau de synthèse par repo
| Repo | Branches surveillées | Lint | Tests | Build | Image GHCR | Déclencheur publication | Statut |
|---|---|---|---|---|---|---|---|
| front-service | `dev`, `prod` | Oui (non bloquant) | Oui (bloquant) | Oui (bloquant) | Oui | Push/merge sur `prod` | En place |
| auth-service | `dev`, `prod` | Oui | Oui | Oui | Oui | Push/merge sur `prod` | À confirmer en détail |
| analysis-store-service | `dev`, `prod` + tags | Oui | Oui | Oui | Oui | Création de tag SemVer | En place |

## Objectifs qualité
- Réduire les régressions.
- Vérifier la capacité de build.
- Assurer la reproductibilité des artefacts.
- Produire des images traçables (tag + digest).

## Limites actuelles
- `infra` sans CI/CD applicative dédiée.
- Couverture de tests non mesurée globalement.
- Caractère bloquant de certaines étapes à préciser (hors front).

## Améliorations prévues
- Harmoniser les workflows entre repos.
- Ajouter des indicateurs de coverage.
- Formaliser audit dépendances automatisé.
- Ajouter scan de sécurité des images Docker.
- Rendre explicite le statut bloquant/non bloquant de chaque job.

## À compléter
- Matrice exacte des jobs GitHub Actions par repo.
- Politique de protection de branches (reviews requises, checks obligatoires).
