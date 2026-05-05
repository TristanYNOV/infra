# Indicateurs de satisfaction

## Objectif du document
Définir les indicateurs de satisfaction produit, technique et exploitation pour piloter la qualité perçue d’Analyse Basket.

## Principes
- Indicateurs orientés usage réel et stabilité.
- Combinaison de mesures qualitatives et techniques.
- Objectifs chiffrés à formaliser progressivement.

## Indicateurs produit
- Capacité à réaliser une analyse complète.
- Capacité à sauvegarder puis récupérer une analyse.
- Clarté des panels.
- Utilité des labels.
- Utilité des statistiques.
- Compréhension du tutoriel.
- Temps de prise en main.

## Indicateurs techniques
- Disponibilité des services.
- Succès des healthchecks.
- Taux d’erreur.
- Stabilité des builds.
- Tests passants.
- Absence de régression critique.

## Indicateurs d’exploitation
- Uptime (Uptime Kuma).
- Incidents ouverts/fermés.
- Temps de résolution.
- État des déploiements.
- État du monitoring.

## Indicateurs utilisateur
- Satisfaction coachs/analystes.
- Compréhension de l’interface.
- Capacité à retrouver une analyse.
- Pertinence des exports/panels.
- Retours qualitatifs des clubs témoins.

## Méthode de collecte
- Recette manuelle et retours d’usage.
- Analyse des tickets GitHub Issues.
- Contrôles healthchecks et monitoring.
- Revue documentaire des validations.

## Tableau de suivi
| Indicateur | Type | Mode de mesure | Objectif cible | Source | Fréquence | Statut | Commentaire |
|---|---|---|---|---|---|---|---|
| Analyse complète réalisable | Produit | Recette scénarios critiques | À compléter | Cahier recette | Mensuelle | En cours | Critère MVP central |
| Sauvegarde/récupération analyse | Produit | Tests fonctionnels ciblés | À compléter | Recette + logs | Mensuelle | En cours | Priorité haute |
| Clarté panel | Produit/UX | Feedback utilisateur | À compléter | Retours qualis | À compléter | À compléter | À structurer |
| Utilité labels/statistiques | Produit | Feedback métier | À compléter | Échanges métier | À compléter | À compléter | Validation terrain future |
| Compréhension tutoriel | Produit/UX | Observation onboarding | À compléter | Tutoriel + retours | À compléter | À compléter | À renforcer |
| Disponibilité services | Technique | Sondes HTTP | À compléter | Uptime Kuma | Quotidienne | En place | Base supervision |
| Healthchecks OK | Technique | Vérification endpoints | À compléter | `/health*` | Quotidienne | En place | Suivi manuel/outillé |
| Taux d’erreur | Technique | Logs/métriques | À compléter | Logs + monitoring | À compléter | À compléter | Métriques avancées à compléter |
| Builds stables | Technique | Statut CI | À compléter | GitHub Actions | Par PR/push | À compléter | Hétérogène par repo |
| Tests passants | Technique | Résultats tests | À compléter | CI/local | Par PR/push | En cours | Coverage non chiffrée globale |
| Uptime service | Exploitation | % disponibilité | À compléter | Uptime Kuma | Mensuelle | À compléter | Seuil à définir |
| Incidents ouverts/fermés | Exploitation | Comptage tickets | À compléter | GitHub Issues | Hebdomadaire | En cours | Processus manuel |
| Temps de résolution | Exploitation | Délai ticket | À compléter | GitHub Issues | Mensuelle | À compléter | Gravité non formalisée |
| Satisfaction coach/analyste | Utilisateur | Retour qualitatif | À compléter | Échanges terrain | À compléter | À compléter | Clubs témoins à activer |

## Limites actuelles
- Peu d’objectifs chiffrés formalisés.
- Collecte encore largement manuelle.
- Validation terrain externe partielle.

## Améliorations prévues
- Formaliser objectifs chiffrés par indicateur.
- Mettre en place un tableau de bord consolidé.
- Structurer collecte feedback utilisateurs cibles.
