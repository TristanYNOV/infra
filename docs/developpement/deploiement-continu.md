# Livraison continue et déploiement contrôlé

## Objectif du document
Décrire le modèle de livraison d’Analyse Basket : publication automatisée des images et déploiement infra manuel volontaire.

## Positionnement
Le projet applique une **livraison continue** (build/publish automatisés) avec un **déploiement contrôlé** côté `infra`, plutôt qu’un déploiement continu strict.

## Distinction des responsabilités
- Livraison automatisée : build, tests, publication GHCR.
- Déploiement infra : mise à jour manuelle des digests et relance contrôlée.

## Pourquoi ce choix
- Garder le contrôle explicite sur la version réellement déployée.
- Éviter un déploiement automatique d’une image non validée fonctionnellement.
- Permettre une validation infra/monitoring avant exposition complète.

## Procédure type
1. Développement sur le repo concerné.
2. Tests locaux.
3. Push ou PR.
4. Exécution CI.
5. Merge vers `prod` ou création de tag selon repo.
6. Build image Docker.
7. Publication GHCR.
8. Récupération du digest `sha256`.
9. Mise à jour du `.env` du repo `infra`.
10. `make pull`.
11. `make up`.
12. Vérification healthchecks.
13. Vérification Uptime Kuma.
14. Recette manuelle.

## Tableau par repo
| Repo | Mode de publication | Registre | Versioning | Déploiement infra | Statut |
|---|---|---|---|---|---|
| front-service | Publication sur `prod` | GHCR | SemVer | Manuel via `infra` | En place |
| auth-service | Publication sur `prod` | GHCR | SemVer | Manuel via `infra` | En place |
| analysis-store-service | Publication via tags | GHCR | SemVer | Manuel via `infra` | En place |
| infra | Publication via tags `v.X.Y.Z` si commit contenu dans `prod` | GHCR | SemVer | Manuel contrôlé | En place |

## Publication image infra
Le repo `infra` publie une image GHCR privée uniquement lorsqu'un tag Git respecte le format `v.X.Y.Z` et pointe vers un commit déjà présent dans la branche `prod`.

Pour un tag `v.1.0.0`, l'image publiée est `ghcr.io/<owner_lower>/infra` avec exactement les tags suivants :
- `latest`
- `prod`
- `1.0.0`

La publication est refusée si le tag ne respecte pas ce format ou si le commit taggé n'appartient pas à `prod`.

## Rollback
- État actuel : aucun rollback formalisé officiellement.
- Amélioration recommandée :
  1. conserver l’ancien digest d’image,
  2. restaurer les valeurs précédentes dans `.env`,
  3. relancer `make pull` puis `make up`,
  4. vérifier healthchecks et disponibilité applicative.

## Points de vigilance
- Cohérence des tags et des digests.
- Utilisation de références immuables (digest) plutôt que `latest`.
- Vérification des variables d’environnement avant redéploiement.
- Contrôle des routes Traefik après mise à jour.
- Vérification des endpoints `/health`, `/healthz`, `/api/health`.

## À compléter
- Procédure rollback détaillée pas-à-pas avec exemples réels.
- Critères explicites de validation avant mise en production.
