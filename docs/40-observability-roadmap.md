# 40 - Observability roadmap

> Cette page décrit le plan. Aucune implémentation n’est faite dans cette étape.

## Niveau 1 (Monitoring de base)
Objectif : savoir rapidement si la plateforme est saine.

Prévoir :
- health checks homogènes par service,
- métriques HTTP essentielles (volumétrie, erreurs, latence),
- tableau de bord de disponibilité,
- alertes simples sur erreurs/indisponibilités.

## Niveau 2 (Traçage distribué)
Objectif : suivre une requête de bout en bout.

Prévoir :
- propagation `request-id` / `trace-id` entre services,
- corrélation logs + traces,
- visualisation des appels inter-services,
- analyse des points de latence et erreurs.

## Préparation dès maintenant
- Stabiliser les routes (`/api/<service>`).
- Standardiser endpoint health.
- Conserver des logs exploitables et horodatés.
