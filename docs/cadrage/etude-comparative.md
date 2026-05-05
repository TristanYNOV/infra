# Étude comparative

## Objectif du document
Comparer les options d’architecture et d’exploitation envisagées, justifier les choix retenus et expliciter les limites.

## Critères de comparaison
- Coût total (développement + exploitation).
- Complexité de mise en œuvre et de maintenance.
- Évolutivité et scalabilité.
- Sécurité et confidentialité.
- Cohérence avec le temps disponible (MVP réalisé seul).

## Synthèse des décisions
| Sujet | Choix retenu | Motif principal |
|---|---|---|
| Monolithe vs multi-services | Multi-services | Séparation responsabilités + évolutivité |
| Stockage vidéo serveur vs non-stockage | Non-stockage vidéo par défaut | Low-cost + réduction contraintes RGPD |
| Local front vs backend persistant | Backend persistant | Sauvegarde durable et récupération |
| Base unique vs bases séparées | MongoDB (auth) + PostgreSQL (analysis-store) | Spécialisation des usages |
| Déploiement manuel vs CI/CD | CI/CD + GHCR | Traçabilité et reproductibilité |
| Exposition directe vs reverse proxy | Traefik | Routage centralisé et évolutif |
| Uptime Kuma vs Prom/Graf | Uptime d’abord puis Prom/Graf | Valeur rapide puis observabilité fine |
| Tutoriel séparé vs intégré | Intégré à la landing page + doc complémentaire | Onboarding produit |
| Extraction front vs service dédié | Non au MVP, FFmpeg dédié envisagé | Isoler la charge et la complexité |

## Comparaisons détaillées
### A. Monolithe vs architecture multi-services
- **Choix retenu** : multi-services.
- **Justification** : séparation des responsabilités, évolutivité, scalabilité différenciée, meilleure préparation à Kubernetes.

### B. Stockage vidéo serveur vs non-stockage vidéo par défaut
- **Choix retenu** : pas de stockage vidéo par défaut.
- **Justification** : réduction des coûts, réduction des contraintes RGPD, simplification hébergement, cohérence low-cost.

### C. Stockage local front vs backend persistant
- **Choix retenu** : backend persistant pour les analyses.
- **Justification** : sauvegarde durable, récupération sur le site, partage futur, ownership, anonymisation.

### D. Base unique vs bases séparées
- **Choix retenu** : MongoDB pour auth, PostgreSQL pour analysis-store.
- **Justification** : séparation identité/données métier, cohérence des usages, JSON + écritures structurées côté PostgreSQL.

### E. Déploiement manuel vs CI/CD avec GHCR
- **Choix retenu** : CI/CD + GHCR.
- **Justification** : traçabilité, reproductibilité, images versionnées, rollback plus fiable.

### F. Exposition directe des services vs reverse proxy Traefik
- **Choix retenu** : Traefik.
- **Justification** : routage centralisé, intégration Docker, évolutivité, gestion préfixes, perspectives plugins JWT.

### G. Uptime Kuma vs Prometheus/Grafana
- **Choix retenu** : Uptime Kuma d’abord, Prometheus/Grafana ensuite.
- **Justification** : visibilité rapide de disponibilité puis enrichissement métrique applicative.

### H. Tutoriel séparé vs tutoriel intégré à la landing page
- **Choix retenu** : tutoriel intégré à la landing page avec documentation complémentaire.
- **Justification** : meilleure expérience utilisateur et onboarding produit.

### I. Extraction vidéo intégrée au front vs service dédié FFmpeg
- **Choix actuel** : extraction non intégrée au MVP.
- **Évolution envisagée** : service dédié FFmpeg.
- **Justification** : isoler une tâche coûteuse, éviter d’alourdir le front, maîtriser les contraintes serveur.

## Choix retenus
Les choix actuels privilégient un compromis entre valeur métier, maîtrise des coûts et capacité de maintenance par une équipe unipersonnelle.

## Limites des choix
- Complexité de coordination multi-repos.
- Besoin de renforcer la couverture de tests au fil des évolutions.
- Observabilité avancée partiellement en cours.

## Évolutions possibles
- Mise en place d’une architecture événementielle interservices.
- Déploiement de monitoring métrique complet (Prometheus/Grafana).
- Ajout du service FFmpeg sous gouvernance coût/conformité.

## À compléter
- Critères quantitatifs détaillés ayant départagé certaines alternatives.
