# Suivi d’avancement

## Objectif du document
Décrire la méthode de suivi d’avancement projet, qualité, risques et documentation pour le MVP Analyse Basket.

## Méthode de suivi
- Suivi pragmatique par repo et par lot.
- Revue régulière des tickets ouverts/fermés.
- Vérification des points critiques (tests, builds, healthchecks, monitoring).

## Outils utilisés
- GitHub Issues
- Branches `dev` / `prod`
- PR / push
- CI
- Tests
- Docker Compose
- Uptime Kuma
- Documentation `docs`

## Indicateurs d’avancement
| Indicateur | Objectif | Source | Fréquence de suivi | Seuil ou critère | Statut actuel | Commentaire |
|---|---|---|---|---|---|---|
| Tickets ouverts/fermés | Maîtriser backlog | GitHub Issues | Hebdomadaire | Tendance fermetures >= ouvertures | À compléter | Suivi manuel par repo |
| Avancement par repo | Vision de progression | Issues/PR/commits | Hebdomadaire | Lots critiques en progression | En cours | Multi-repos |
| État builds CI | Fiabilité livraison | CI repo | À chaque PR/push | Builds principaux passants | À compléter | Dépend repo |
| État tests | Limiter régressions | CI + local | À chaque lot | Tests critiques passants | En cours | Coverage non chiffrée globale |
| État healthchecks | Disponibilité | Endpoints health | Quotidienne en exploitation | `/healthz`,`/health`,`/api/health` OK | À compléter | Vérif Uptime |
| Anomalies critiques | Réduction risque | Issues incidents | Hebdomadaire | 0 anomalie critique ouverte durable | À compléter | Processus en consolidation |
| État monitoring | Détection incidents | Uptime Kuma | Quotidienne | Sondes au vert | En place | Prom/Graf à compléter |
| Documentation à jour | Maintenabilité | Repo docs | À chaque évolution majeure | Docs alignées avec implémentation | En cours | Discipline continue |
| Avancement MVP | Atteinte objectif produit | Synthèse pilotage | Mensuelle | Analyse + sauvegarde + récupération validées | En cours | Critère central |

## Suivi des risques
- Révision régulière des risques critiques (données, sécurité, disponibilité, coûts).
- Priorisation des actions de mitigation selon criticité.

## Suivi des anomalies
- Tickets par repo, catégorisation possible par préfixe.
- Traitement selon impact sur MVP et stabilité.

## Suivi de la qualité
- Vérification des builds/tests.
- Recette manuelle des parcours critiques.
- Contrôle des flux interservices via infra.

## Suivi de la documentation
- Mise à jour des documents structurants après évolution majeure.
- Vérification de cohérence entre docs, tickets et état des services.

## Limites actuelles
- Pas de tableau de bord projet automatisé complet.
- Pilotage très dépendant du suivi manuel.

## Améliorations prévues
- Mettre en place un tableau de bord consolidé (ex : GitHub Projects).
- Définir des seuils cibles plus précis par indicateur.
- Formaliser une revue périodique intégrée (qualité + risques + exploitation).

## Informations à compléter
- Seuils chiffrés cibles de chaque indicateur.
- Cadence formelle de comité de suivi.
