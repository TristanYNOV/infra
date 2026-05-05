# Plan de correction des bogues

## Objectif du document
Décrire le processus réel de correction des anomalies et proposer des améliorations de pilotage qualité.

## Processus réel de correction
1. Détection.
2. Reproduction.
3. Création d’une GitHub Issue dans le repo concerné.
4. Catégorisation via préfixe éventuel entre crochets.
5. Correction.
6. Test.
7. Merge vers `prod`.
8. Test infra.

## Outils utilisés
- GitHub Issues (tickets par repo).
- Pull requests par repo.
- Validation via tests repo + recette manuelle + tests infra.

## Catégorisation actuelle
- Préfixes observés selon besoins : `[bug]`, `[feature]`, `[infra]`, `[doc]`, `[security]`.
- Niveaux de gravité formalisés : non en place actuellement.

## Proposition d’amélioration de la gravité
Recommandation (à instaurer) :
- **Bloquant**
- **Majeur**
- **Mineur**
- **Amélioration**

## Cycle de correction recommandé
| Étape | Description | Sortie attendue |
|---|---|---|
| Qualification | Reproduire et cadrer l’impact | Issue qualifiée |
| Priorisation | Classer selon gravité/risque | Ordre de traitement |
| Correction | Implémenter patch ciblé | PR associée |
| Validation | Tests automatiques + recette ciblée | Décision de merge |
| Livraison | Intégration `prod` + déploiement infra contrôlé | Correctif en ligne |
| Vérification | Healthchecks + monitoring + retours | Clôture ticket |

## Exemples d’anomalies rencontrées
- Erreur `id is immutable` lors de la sauvegarde d’une timeline.
- Routage `/analysis` entre front, Traefik et analysis-store.
- Vérifications autour de l’anonymisation des panels.
- CI/CD du service analysis-store.
- Intégration Uptime Kuma.
- Affichage de modales.
- Instrumentation métriques jugée trop intrusive dans certaines routes, réflexion vers middleware.

## Traçabilité
- Une issue doit référencer le contexte, la reproduction, la correction et la validation.
- Le modèle recommandé est `docs/utils/templates/fiche-anomalie-template.md`.

## Limites actuelles
- Pas de gravité formelle standardisée entre repos.
- Historisation des causes racines à renforcer.
- Tableaux de bord consolidés qualité/incidents à formaliser.

## À compléter
- SLA interne de correction selon gravité.
- Processus de post-mortem standardisé pour incidents majeurs.
