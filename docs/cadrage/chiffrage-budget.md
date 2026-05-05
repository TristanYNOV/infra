# Chiffrage et budget

## Objectif du document
Présenter un macro-chiffrage basé sur la charge déjà investie et cadrer les postes de coûts possibles sans produire de budget fictif.

## Méthode de chiffrage
- Approche par lots fonctionnels et techniques.
- Estimation de charge qualitative (durées approximatives investies).
- Distinction entre coût initial et coût récurrent.
- Les montants financiers restent `À compléter`.

## Hypothèses
- Projet mené principalement par une seule personne.
- MVP réalisé en parallèle d’une activité professionnelle/personnelle/études.
- Positionnement low-cost et sobriété infra.

## Charge approximative déjà investie
| Lot | Charge estimée | Commentaire |
|---|---|---|
| Front Angular SSR | Environ 5 mois | Cœur de l’expérience utilisateur |
| Auth-service | Environ 2 mois | Identité, sessions, rôles |
| Analysis-store-service | Environ 2 mois | Timelines/panels et persistance |
| Infra Docker/Traefik | Environ 3 mois | Orchestration, routage, déploiement |
| CI/CD | Environ 1 mois | Pipelines et industrialisation |
| Monitoring | Environ 2 semaines | Uptime Kuma et supervision initiale |
| Documentation | Environ 2 semaines | Structuration et transmission |
| Debug / corrections | En continu | Stabilisation progressive |

## Macro-chiffrage par lots projet
| Lot | Type | Charge (ordre de grandeur) | Statut |
|---|---|---|---|
| Cadrage fonctionnel | Produit | À compléter | En cours |
| Architecture | Technique | À compléter | En cours |
| Front Angular SSR | Développement | ~5 mois | Réalisé en grande partie |
| Auth-service | Développement | ~2 mois | Réalisé en grande partie |
| Analysis-store timelines | Développement | Inclus dans ~2 mois | En place |
| Analysis-store panels | Développement | Inclus dans ~2 mois | En place |
| Anonymisation | Produit/Sécurité | À compléter | En place, à surveiller |
| Intégration front/back | Intégration | À compléter | En cours |
| CI/CD | Exploitation | ~1 mois | En place |
| Infra Docker/Traefik | Exploitation | ~3 mois | En place |
| Uptime Kuma | Exploitation | ~2 semaines | En place |
| Prometheus/Grafana | Exploitation | À compléter | Prévu/en cours |
| Tests et recette | Qualité | À compléter | En cours |
| Documentation | Gouvernance | ~2 semaines | En cours |
| Corrections | Maintenance | Continu | En cours |
| Tutoriel landing page | UX | À compléter | Prévu |
| Extraction vidéo future | Évolution | À compléter | Hors MVP |
| Contextualisation club/équipe/joueurs | Évolution | À compléter | Hors MVP |

## Postes de coûts possibles
| Poste | Coût initial | Coût récurrent | Notes |
|---|---|---|---|
| Développement | À compléter | À compléter | Principalement temps humain |
| Hébergement | À compléter | À compléter | Europe privilégiée si possible |
| Base de données | À compléter | À compléter | Selon offre d’hébergement |
| Stockage vidéo éventuel | À compléter | À compléter | Sujet sensible coût/RGPD |
| Nom de domaine éventuel | À compléter | À compléter | Optionnel selon stratégie |
| Monitoring | À compléter | À compléter | Uptime puis Prom/Graf |
| Outils de développement | À compléter | À compléter | Selon stack utilisée |
| Maintenance | À compléter | À compléter | Corrections et évolutions |
| Sécurité | À compléter | À compléter | Audits, durcissement, secrets |
| Sauvegardes | À compléter | À compléter | Priorité avant montée en charge |
| Documentation | À compléter | À compléter | Mises à jour continues |

## Limites de l’estimation
- Chiffrage non contractuel.
- Variabilité forte liée à la disponibilité du porteur de projet.
- Certaines charges évolutives (tests, monitoring avancé, FFmpeg).

## Informations à compléter
- Valorisation financière (TJM ou coût interne de référence).
- Seuils budgétaires acceptables mensuels et annuels.
- Scénarios de coûts selon montée en charge utilisateur.
