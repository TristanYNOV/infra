# Opportunités et menaces

## Objectif du document
Présenter une analyse SWOT d’Analyse Basket et les actions de maîtrise associées.

## Analyse SWOT
| Catégorie | Éléments |
|---|---|
| Forces | Besoin réel observé, positionnement low-cost, pas de stockage vidéo par défaut, architecture modulaire, séparation front/auth/analysis-store, CI/CD, dockerisation, monitoring disponibilité, documentation centralisée, panels personnalisables, adaptabilité multi-sports |
| Faiblesses | Projet développé seul, complexité multi-repos, couverture de tests à maintenir/renforcer, infrastructure initialement peu maîtrisée, documentation encore en consolidation, accessibilité limitée sur usages purement visuels, extraction vidéo non intégrée au MVP |
| Opportunités | Adoption par clubs amateurs, usage pédagogique STAPS, extension multi-sports, modèles de panels, partage de panels publics, extraction vidéo automatisée, statistiques avancées, monitoring avancé Prometheus/Grafana, architecture événementielle future |
| Menaces | Concurrence d’outils spécialisés, hausse des coûts si stockage vidéo ajouté, mauvaise configuration sécurité, perte de données sans backup, complexité de maintenance, difficulté de prise en main, risque RGPD (vidéos/noms), dette technique si divergence des contrats API |

## Actions de maîtrise
| Sujet | Action de maîtrise | Responsable | Priorité | Échéance | Statut |
|---|---|---|---|---|---|
| Couverture tests | Renforcer progressivement tests critiques et non-régression | Porteur du projet | Haute | Continue | En cours |
| Risque sécurité | Revue régulière auth/roles/ownership/secrets | Porteur du projet | Haute | Continue | En cours |
| Coûts vidéo | Maintenir non-stockage par défaut, cadrer stockage temporaire si besoin | Porteur du projet | Haute | Avant mise en ligne large | En cours |
| Perte de données | Définir stratégie backup/restauration | Porteur du projet | Critique | À planifier avant production élargie | À lancer |
| Complexité infra | Standardiser procédures de déploiement/monitoring | Porteur du projet | Haute | Continue | En cours |
| Adoption utilisateur | Tutoriel intégré + documentation parcours | Porteur du projet | Moyenne | MVP+ | Prévu |
| Dette API | Formaliser contrats et compatibilité inter-repos | Porteur du projet | Moyenne | À compléter | À compléter |

## Note sur les anomalies
Aucune anomalie critique en production n’est identifiée à ce stade, mais plusieurs anomalies de développement et de préproduction ont permis d’alimenter le processus de correction et d’amélioration.
