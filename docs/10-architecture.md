# 10 - Architecture

## Vue textuelle
- `infra` orchestre les conteneurs via Docker Compose.
- Traefik route les requêtes HTTP vers les services internes.
- `front-service` et `auth-service` communiquent via un réseau Docker privé commun (`infra-backend`).
- Aucun port n’est publié pour les services applicatifs en mode core.
- `docker-compose.direct.yml` fournit uniquement un mode de debug local explicite.

## Schéma ASCII (local DEV)

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
             network: infra-backend (interne)
          +--------+--------------------+
          |                             |
 PathPrefix(`/`)                  PathPrefix(`/api/auth`)
 priority=1                       priority=100
          |                       + StripPrefix(`/api/auth`)
          v                             v
 +-------------------+         +--------------------+
 |   front-service   |         |    auth-service    |
 |      Angular      |         | signup/login/JWT   |
 +-------------------+         +--------------------+

 Optional profile: watchtower (DEV/staging only)
   -> poll registry, pull, restart services labelisés
```

## Vision cible (au-delà de la V1)
- Ajout progressif de services sous `/api/<service>` (ex: `export-service`).
- Les services construisent/publient leurs images dans leurs repos respectifs.
- Ce repo `infra` orchestre pull/restart et conventions système.
