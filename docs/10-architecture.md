# 10 - Architecture

## Vue d’ensemble (local)

```text
                      Host machine
                           |
                   http://localhost:80
                           |
                    +--------------+
                    |   Traefik    |
                    |  (gateway)   |
                    +------+-------+
                           |
                     network: backend
               +-----------+------------+
               |                        |
      PathPrefix(`/`)         PathPrefix(`/api/auth`)
               |               + StripPrefix(`/api/auth`)
               v                        v
       +---------------+         +---------------+
       | front-service |         | auth-service  |
       | (Angular)     |         | (JWT API)     |
       +---------------+         +---------------+
```

## Décisions clés
- Traefik est le seul composant exposé au host (`80`, dashboard local `127.0.0.1:8080`).
- `front-service` et `auth-service` ne publient aucun port en mode normal.
- Une seule network Docker (`backend`) pour les communications inter-services.
- Le mode debug direct auth est isolé dans `docker-compose.direct.yml`.
