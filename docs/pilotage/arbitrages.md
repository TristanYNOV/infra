# Arbitrages

## Objectif du document
Tracer les décisions structurantes du projet et leurs impacts sur produit, technique et exploitation.

## Journal d’arbitrages
| Sujet | Option A | Option B | Décision | Justification | Contexte | Impact | Risque accepté | Revue prévue | Date | Statut |
|---|---|---|---|---|---|---|---|---|---|---|
| Architecture globale | Microservices | Monolithe | Microservices | Séparation des responsabilités, évolutivité | Croissance progressive des besoins | Meilleure modularité | Complexité multi-repos | Oui | À compléter | Actif |
| Monitoring initial | Prometheus/Grafana immédiat | Uptime Kuma d’abord | Uptime Kuma d’abord | Mise en place rapide disponibilité | Besoin de visibilité rapide | Supervision de base disponible | Métriques fines retardées | Oui | À compléter | Actif |
| Stockage métier | Local front | Backend persistant analysis-store | Backend persistant | Durabilité, partage, historisation | Critère sauvegarde/récupération MVP | Fiabilité fonctionnelle | Coût complexité backend | Oui | À compléter | Actif |
| Tutoriel utilisateur | Document externe uniquement | Tutoriel intégré landing page | Intégré landing page | Onboarding contextualisé | Adoption utilisateur | Meilleure prise en main | Effort UI supplémentaire | Oui | À compléter | Actif |
| Suppression utilisateur | Synchrone | Asynchrone à terme | Asynchrone à terme | Résilience interservices | Multi-service | Scalabilité de traitement | Complexité d’orchestration | Oui | À compléter | Cible |
| Gestion vidéo | Stockage serveur | Pas de stockage vidéo par défaut | Pas de stockage par défaut | Réduction coûts + contraintes RGPD | Positionnement low-cost | Coût maîtrisé | Fonctionnalités vidéo limitées | Oui | À compléter | Actif |
| Base analysis-store | PostgreSQL | Autre base | PostgreSQL | Données structurées + JSON, maîtrise techno | Besoin persistance métier | Cohérence modèle | Migrations à piloter | Oui | À compléter | Actif |
| Base auth | MongoDB | Base relationnelle | MongoDB | Cohérence stack NestJS/Mongoose | Domaine auth/sessions | Rapidité implémentation | Multiplication technos BDD | Oui | À compléter | Actif |
| Exposition services | Compose+Traefik | Exposition directe | Compose+Traefik | Routage centralisé et contrôlé | Besoin d’isolation | Sécurité/routage améliorés | Config proxy à maîtriser | Oui | À compléter | Actif |
| Livraison | GHCR auto + déploiement infra manuel | Déploiement full auto | Semi-automatisé | Contrôle version réellement mise en ligne | Contexte exploitation prudent | Réduction risque déploiement | Temps opérationnel manuel | Oui | À compléter | Actif |
| Références images | Digest `sha256` | Tags mouvants | Digest prioritaire | Traçabilité et reproductibilité | Environnement critique | Déploiement déterministe | Gestion manuelle plus stricte | Oui | À compléter | Actif |
| Validation finale | Checklist manuelle | Automatisation complète | Checklist manuelle + auto progressive | Couverture pragmatique MVP | Outils e2e non exhaustifs | Réduction risque métier | Charge humaine recette | Oui | À compléter | Actif |
| Instrumentation métriques | Instrumentation route par route | Middleware dédié à terme | Évolution vers middleware | Réduire intrusion logique métier | Retour d’expérience dev | Maintenabilité technique | Refacto future nécessaire | Oui | À compléter | En cours |
| Organisation documentaire | Documentation dans `infra/docs` | Dossier scolaire séparé | `infra/docs` centralisé | Source unique projet/exploitation | Besoin transmission maintenable | Cohérence documentaire | Discipline MAJ requise | Oui | À compléter | Actif |
