# Environnement de développement

## Objectif du document
Décrire l’environnement technique de développement d’Analyse Basket et les pratiques locales pour travailler par repo ou en intégration complète.

## Plateformes et IDE
- Plateformes : macOS et Windows.
- IDE principaux : WebStorm ; VS Code en alternative.

## Runtime et versions cibles
- Node.js : `>= 22`.
- npm : `>= 10`.
- Évolution envisagée : Node 24 dès que l’écosystème projet est validé.

## Repos concernés
- `front-service`
- `auth-service`
- `analysis-store-service`
- `infra`

## Outils principaux
- Git
- npm
- Docker
- Docker Compose
- Makefile du repo `infra`
- Navigateur web
- Postman ou collections JSON d’API
- GitHub
- GHCR

## Ports locaux connus
| Service / usage | Port |
|---|---|
| Front Angular (dev) | 4200 |
| Front SSR (prod/conteneur) | 4000 |
| auth-service | 3000 |
| analysis-store-service | 3001 |
| Uptime Kuma | 3002 |
| Traefik dashboard | 8080 |

## Modes de lancement
### Développement d’un repo isolé
- Lancement via scripts npm du repo concerné (`npm run start`, `npm run start:dev` ou équivalent selon service).

### Bases de données
- MongoDB et PostgreSQL lancées en pratique via Docker.

### Intégration complète
- Validation interservices via images Docker et Docker Compose.
- Dans `infra`, usage courant :
  - `make pull`
  - `make up`

## Bonnes pratiques locales
- Vérifier les variables d’environnement avant lancement.
- Lancer tests/lint/build du repo modifié avant PR.
- Tester via Docker dès qu’un flux interservices est touché.
- Ne jamais commiter de secrets.
- Vérifier les healthchecks après lancement infra (`/healthz`, `/health`, `/api/health`).

## À compléter
- Commandes exactes par repo (`front-service`, `auth-service`, `analysis-store-service`) selon scripts npm courants.
- Prérequis système détaillés (versions Docker Desktop, navigateurs de référence).
