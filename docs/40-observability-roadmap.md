# 40 - Observability roadmap

> Document de planification uniquement (aucune implémentation dans ce repo à ce stade).

## Niveau 1 - Monitoring opérationnel de base
Objectif : détecter rapidement les indisponibilités et dégradations.

Prévoir :
- endpoints health homogènes,
- métriques HTTP principales (RPS, taux d’erreurs, latence p95/p99),
- dashboard de disponibilité (gateway + services),
- alertes de base (5xx, health KO, latence anormale).

## Niveau 2 - Traçage distribué
Objectif : suivre une requête front -> gateway -> service(s).

Prévoir :
- propagation d’identifiants (`request-id`, `trace-id`),
- corrélation logs/traces,
- visualisation des appels inter-services,
- analyse des goulots de latence.

## Préparation à faire dès maintenant
- Conserver une convention de routes stable (`/api/<service>`).
- Uniformiser un endpoint `/health`.
- Écrire des logs structurés et horodatés.
- Documenter les contrats d’erreur HTTP.

## Explicitement hors scope V1
- Pas d’intégration outillée type Prometheus/Tempo/Jaeger dans cette étape.
