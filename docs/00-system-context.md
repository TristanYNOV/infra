# 00 - System context

## Vision
Plateforme d’analyse vidéo sportive en architecture microservices, avec un point d’entrée HTTP unique pour le client.

## Objectifs MVP
- Livrer un front web consommant l’auth API.
- Uniformiser l’entrée HTTP via Traefik.
- Éviter l’exposition directe des services internes en mode standard.
- Rendre les conventions explicites avant l’arrivée de nouveaux services.

## Services existants
- `front-service` (Angular): UI cliente.
- `auth-service` (JWT): endpoints d’authentification.
- `traefik` (gateway): routage HTTP et futur point de contrôle de sécurité transverse.

## Principe fondamental
**Traefik est l’unique entrypoint HTTP côté client.**

Conséquences:
- le front est servi derrière Traefik,
- l’auth API est appelée via `/api/auth/*`,
- l’accès direct à `auth-service` est désactivé par défaut (possible uniquement en mode debug explicite).

## Hors périmètre de cette étape
- Validation JWT au niveau gateway.
- Stack d’observabilité (Prometheus/Tempo/Jaeger).
- Infrastructure de production (K8s, cloud networking, etc.).
