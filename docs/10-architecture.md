# 10 - Architecture

## Vue textuelle
- `infra` orchestre des **images déjà publiées** (pas de build applicatif local).
- Traefik route les requêtes HTTP vers les services internes.
- `front-service`, `auth-service`, `analysis-store-service`, `analysis-store-migrate`, `mongo` et `postgres` communiquent via le réseau Docker `infra-backend`.
- Seuls les ports Traefik sont publiés en local (`80` + dashboard loopback).
- Mongo n’est pas exposé sur l’hôte.

## Contrats utilisés comme source de vérité
- `docs/contracts/auth-service/infra/INFRA_CONTRACT.md`
- `docs/contracts/front-service/deployment/README.md`
- `docs/contracts/front-service/deployment/reverse-proxy.md`
- `docs/contracts/front-service/deployment/runtime-env.example`
- `docs/contracts/analysis-store/infra/README.md`

## Schéma ASCII (local V1)

```text
                               Host machine
                                     |
                   +-----------------+-----------------+
                   |                                   |
             http://localhost:80                 127.0.0.1:8080
                   |                            (Traefik dashboard)
                   v
             +-----------+
             |  Traefik  |
             +-----+-----+
                   |
                 network: infra-backend
          +--------+-----------------------------+
          |                                      |
 PathPrefix(`/auth|/users|/me|/health`)   PathPrefix(`/`) priority=1
 priority=100                             (fallback frontend)
          |                                      |
          v                                      v
 +--------------------+                  +-------------------+
 |    auth-service    |                  |   front-service   |
 |       :3000        |                  |       :4000       |
 +---------+----------+                  +-------------------+
           |
           v
      +---------+
      |  mongo  |
      | :27017  |
      +---------+
```

## Vision cible (après V1)
- Garder le même modèle : gateway unique + services privés.
- Ajouter des services supplémentaires avec règles Traefik explicites.
- Continuer à déployer avec images immuables (digest GHCR) quand disponibles.
