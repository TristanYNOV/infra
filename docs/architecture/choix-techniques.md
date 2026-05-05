# Choix techniques

## Objectif du document
Présenter les choix techniques structurants d’Analyse Basket, leurs motivations, leurs limites et les alternatives considérées.

## Tableau des choix techniques
| Choix | Besoin couvert | Avantages | Limites | Alternatives étudiées | Justification |
|---|---|---|---|---|---|
| Angular SSR | UI web + SEO/temps de rendu initial | Framework robuste, SSR, écosystème mature | Complexité SSR | SPA pure | Cohérent pour front riche et landing page |
| NestJS | Structurer APIs backend | Architecture modulaire, DTO/guards, TypeScript | Overhead initial | Express/Fastify custom | Bon compromis maintenabilité/productivité |
| MongoDB (auth) | Stockage identité/sessions | Schéma flexible, usage courant auth | Gouvernance schéma à cadrer | PostgreSQL unique | Séparation du domaine auth |
| PostgreSQL (analysis-store) | Persistance métier structurée | Requêtes robustes, intégrité relationnelle | Migrations à piloter | MongoDB | Adapté aux ressources métier versionnables |
| Docker Compose | Orchestration locale/prod simple | Lisible, standard, rapide à opérer | Limité pour grande échelle | Kubernetes | Suffisant pour périmètre actuel |
| Traefik | Exposition centralisée et routage | Intégration Docker labels, routage flexible | Complexité de priorités | Exposition directe Nginx brut | Réduit l’exposition des services |
| GHCR | Distribution images | Intégré GitHub, gestion tags/digests | Dépendance écosystème GitHub | Docker Hub privé | Aligné avec pipelines GitHub |
| Uptime Kuma | Monitoring disponibilité | Mise en place rapide, lisible | Peu orienté métriques fines | Prometheus/Grafana seul | Couverture rapide des checks critiques |
| Prometheus/Grafana (à venir) | Métriques et observabilité avancées | Dashboards, alerting, séries temporelles | Mise en œuvre plus lourde | Stack logs seule | Évolution naturelle de la supervision |
| GitHub Actions (CI/CD) | Industrialiser build/test/release | Automatisation, traçabilité, intégration repo | Dépendance provider | GitLab CI, Jenkins | Cohérence avec GHCR et repos GitHub |

## Comparaisons structurantes
| Sujet | Option retenue | Option alternative | Motif principal |
|---|---|---|---|
| Monolithe vs microservices | Services séparés (front/auth/analysis-store) | Monolithe unique | Isolation des responsabilités et évolutivité |
| Stockage local front vs backend persistant | Backend persistant | Local uniquement | Fiabilité, partage, durabilité des données |
| Déploiement manuel vs CI/CD | CI/CD | Manuel systématique | Répétabilité, qualité et auditabilité |
| Exposition directe vs reverse proxy | Traefik reverse proxy | Exposition directe | Centralisation sécurité/routage |
| Monitoring simple vs métriques avancées | Uptime Kuma + évolution Prometheus | Uptime uniquement | Monter en maturité observabilité |

## Cohérence globale des choix
Les choix techniques convergent vers une architecture modulaire, exploitable et progressive : séparation claire des responsabilités, persistance maîtrisée côté backend, exposition unifiée via Traefik, et chaîne de livraison industrialisée autour de GitHub.

## Dette technique et évolutions possibles
- Renforcer l’accessibilité des interfaces critiques.
- Compléter les métriques Prometheus et tableaux Grafana.
- Renforcer les tests end-to-end.
- Formaliser davantage les contrats API (versioning, compatibilité).
- Ajouter un processus événementiel interservices pour les flux transverses.
- Améliorer l’observabilité logs/traces corrélées.

## À compléter
- Alternatives réellement testées en PoC et résultats mesurés.
- Critères quantifiés ayant mené à chaque arbitrage.
