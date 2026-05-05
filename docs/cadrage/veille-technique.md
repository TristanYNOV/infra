# Veille technique

## Objectif du document
Décrire la démarche de veille d’Analyse Basket, ses sources, ses thèmes et son impact sur les décisions projet.

## Objectifs de la veille
- Identifier des solutions adaptées au contexte low-cost.
- Réduire les risques techniques et d’exploitation.
- Maintenir une architecture cohérente et évolutive.
- Anticiper sécurité, accessibilité, observabilité et conformité.

## Méthode de veille
Lorsqu’une problématique est rencontrée, le porteur du projet réalise d’abord une exploration conceptuelle et technique, notamment via échanges IA, recherches web et discussions. Les solutions identifiées sont ensuite comparées, challengées avec collègues ou via IA, puis validées par documentation, expérimentation ou intégration progressive.

L’IA est utilisée comme **outil d’exploration et d’aide à la recherche**, et non comme source unique de vérité. Les décisions sont consolidées par comparaison de sources, tests et retours d’expérience.

## Sources de veille
- Amis et collègues techniques.
- Instagram.
- YouTube.
- Actualités Angular.
- Discussions IA.
- Discord.
- Recherches Google thématiques.
- Documentations officielles (Angular, NestJS, Docker, Traefik, GitHub Actions, GHCR, Uptime Kuma, Prometheus/Grafana).
- Référentiels OWASP et RGAA / bonnes pratiques accessibilité.
- Cours, TP et expérimentations.

## Thèmes suivis et apports
| Thème | Source ou canal | Information recherchée | Apport pour le projet | Décision influencée | Statut |
|---|---|---|---|---|---|
| Angular SSR | Doc Angular, YouTube, news | Structuration front et SSR | Base architecture front | Choix Angular SSR | Actif |
| Signaux Angular | Doc Angular, communautés | Patterns réactifs front | Simplification état UI | Orientation implémentation front | Actif |
| NestJS | Doc NestJS, collègues, IA | Structuration backend | Standardisation services | Choix NestJS | Actif |
| Docker | Doc Docker, TP, Google | Orchestration conteneurs | Déploiement homogène | Choix Docker Compose | Actif |
| Traefik | Doc Traefik, Discord | Routage préfixes et labels | Exposition centralisée | Choix reverse proxy Traefik | Actif |
| CI/CD | GitHub Actions docs, IA | Automatisation build/release | Réduction erreurs manuelles | Choix CI/CD multi-repos | Actif |
| GHCR | Docs GitHub/GHCR | Gestion images versionnées | Traçabilité des versions | Pipeline de publication images | Actif |
| Monitoring | Uptime Kuma docs, Prom/Graf docs | Disponibilité + métriques | Vision progressive supervision | Uptime d’abord, Prom/Graf ensuite | Actif |
| Sécurité OWASP | OWASP, Google, IA | Risques web applicatifs | Checklist sécurité projet | Priorisation contrôles sécurité | Actif |
| Accessibilité | RGAA, bonnes pratiques web | Exigences UX inclusives | Amélioration parcours et formulaires | Plan accessibilité progressif | Actif |
| PostgreSQL JSON | Docs PostgreSQL, expérimentations | Persistance structurée | Modèle adapté timelines/panels | Choix PostgreSQL analysis-store | Actif |
| MongoDB/Mongoose | Docs MongoDB, NestJS | Sessions/utilisateurs auth | Flexibilité auth | Choix MongoDB auth | Actif |
| Architecture microservices | Retours TP/cours, collègues | Découpage responsabilités | Évolutivité service par service | Choix multi-services | Actif |
| RGPD / anonymisation | Sources juridiques à compléter, IA, échanges | Encadrement données sensibles | Réduction exposition identités | Priorité anonymisation | À renforcer |
| Extraction vidéo FFmpeg (future) | Docs FFmpeg, retours techniques | Faisabilité, coûts, charge | Vision future du module extraction | Service dédié envisagé | Prévu |

## Synthèse des apports au projet
- Confirmation d’un socle technique cohérent (Angular SSR, NestJS, Docker, Traefik).
- Consolidation des choix de séparation des responsabilités.
- Mise en place d’une supervision initiale pragmatique (Uptime Kuma).
- Préparation d’une montée en maturité (Prometheus/Grafana, sécurité, accessibilité).

## Décisions influencées par la veille
- Abandon du monolithe au profit d’une architecture multi-services.
- Non-stockage vidéo par défaut pour limiter coûts et contraintes RGPD.
- Séparation MongoDB (auth) / PostgreSQL (analysis-store).
- Industrialisation CI/CD avec publication d’images GHCR.

## Veille à poursuivre
- Formalisation des contrats API inter-repos.
- Durcissement sécurité (rate limiting, logs de sécurité, revues régulières).
- Stratégie RGPD en cas de stockage vidéo temporaire.
- Observabilité avancée (metrics, logs corrélés, alerting).

## À compléter
- Fréquence formelle des revues de veille.
- Processus d’archivage des décisions issues de veille.
- Sources juridiques RGPD de référence utilisées dans le projet.
