# Tests

## Objectif du document
Présenter la stratégie de test d’Analyse Basket, ses pratiques actuelles et ses axes de renforcement.

## Stratégie de test
La stratégie de test est progressive et priorise les fonctionnalités critiques : authentification, sauvegarde des timelines, sauvegarde des panels, droits d’accès, anonymisation, export/copie et parcours utilisateur principaux.

## Tests par repo
| Repo | Outil | Commande | Périmètre | Statut | Limites |
|---|---|---|---|---|---|
| front-service | Angular test runner + ChromeHeadless | `npm run test:ci` | Fichiers `.spec`, logique front | En place | Couverture globale non chiffrée |
| front-service | Cypress (présent selon scénarios) | À compléter | Parcours e2e ciblés | À confirmer | Périmètre exact à documenter |
| auth-service | Jest | À compléter | Unitaires/intégration auth | En place | Détail suites à compléter |
| analysis-store-service | Jest | À compléter | Unitaires/intégration store | En place | Détail suites à compléter |
| infra | Vérifications manuelles | `make pull`, `make up` + checks | Intégration interservices | En place | Non automatisé |

## Tests critiques
- Inscription.
- Login.
- Logout.
- Refresh token.
- Accès `/me`.
- Rôles utilisateur/admin.
- Création, sauvegarde et mise à jour timeline.
- Création, sauvegarde et mise à jour panel.
- Publication panel.
- Anonymisation.
- Export/copy.
- Interdiction de modifier la ressource d’un autre utilisateur.
- Routage Traefik.
- Healthchecks.
- Status page Uptime Kuma.

## Limites actuelles
- Aucune couverture de test chiffrée consolidée.
- Renforcement des tests en cours.
- Certains scénarios restent principalement validés en manuel.

## Améliorations prévues
- Mesurer et suivre la coverage par repo.
- Harmoniser la nomenclature des suites et rapports de test.
- Étendre les scénarios multi-utilisateurs (ownership).
- Renforcer les tests e2e front et flux interservices.
- Maintenir la checklist manuelle de recette en complément.

## À compléter
- Commandes exactes Jest par repo backend.
- Liste exhaustive des suites Cypress réellement actives.
