# Arbitrages

## Objectif du document
Tracer les décisions structurantes et leurs justifications.

## Journal d’arbitrages
| Sujet | Option A | Option B | Décision | Justification | Date | Statut |
|---|---|---|---|---|---|---|
| Architecture | Microservices | Monolithe | Microservices | Aligné avec séparation front/auth/store | À compléter | Actif |
| Monitoring | Prometheus/Grafana immédiat | Uptime Kuma d’abord | Uptime Kuma d’abord | Mise en œuvre rapide des sondes critiques | À compléter | Actif |
| Stockage métier | Local front | Backend persistant analysis-store | Backend persistant | Cohérence, partage, historisation | À compléter | Actif |
| Tutoriel | Document externe uniquement | Tutoriel intégré landing page | Intégré landing page | Adoption utilisateur et contextualisation | À compléter | Actif |
| Suppression utilisateur | Synchrone | Événement asynchrone à terme | Asynchrone à terme | Résilience inter-services | À compléter | Cible |
