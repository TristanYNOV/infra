# 00 - System context

## Produit
Application web d’analyse vidéo sportive.

Le `front-service` (Angular) est l’application principale côté client : timeline, séquenceur, lecture vidéo en navigateur.

## Cible d’architecture
- Architecture microservices.
- 1 repository par service applicatif.
- `infra` centralise le contexte transverse + orchestration + conventions.

## Services
### Existant aujourd’hui
1. `front-service` (Angular)
2. `auth-service` (auth MVP : inscription, connexion, émission JWT)

### Prévu ensuite (non implémenté ici)
- `export-service` (sauvegarde/export JSON timeline/séquenceur)

## Règles réseau/sécurité globales
- Traefik est l’unique point d’entrée HTTP.
- Le client (navigateur/Postman en mode intégration) appelle Traefik.
- Les services internes ne sont pas exposés directement par défaut.
- Convention de routes : `/api/<service>/*`.

## Auth : périmètre MVP
Le `auth-service` est volontairement découplé des règles métier avancées (club/équipe/permissions fines).

Rôle actuel :
- inscription,
- connexion,
- émission JWT.

Évolution prévue : vérification JWT au niveau Traefik (middleware dédié), **non activée dans cette V1**.

## Objectif immédiat de ce repo infra
- Fournir un environnement Docker local fonctionnel et sécurisé.
- Permettre le test d’`auth-service` via Traefik (`/api/auth`).
- Préparer le modèle de déploiement simple DEV/staging (Watchtower Option 1).
