# 40 - Observability roadmap (plan)

> Périmètre: planification uniquement (pas d’implémentation dans cette étape).

## Objectif
Introduire une observabilité progressive, utile d’abord au debug local puis à l’analyse cross-service.

## Niveau 1 - Metrics (stabilité opérationnelle)
### Cible
Mesurer l’état de la plateforme et les erreurs principales.

### Ce qu’on veut suivre
- disponibilité des services (`up`),
- volume de requêtes par route,
- taux d’erreurs HTTP (4xx/5xx),
- latence p50/p95/p99 par endpoint critique.

### Préparation attendue
- endpoints health standardisés,
- conventions de nommage de routes (voir ci-dessous),
- logs d’accès Traefik activés (déjà prévu).

## Niveau 2 - Traces distribuées (diagnostic inter-services)
### Cible
Corréler une requête client à son parcours front -> gateway -> backend.

### Conventions de base
- Propager un `trace-id`/`request-id` de bout en bout.
- Logger cet identifiant dans chaque service.
- Conserver un nom de route stable (ex: `auth.login`, `auth.refresh`, `video.jobs.list`).

### Bénéfice
Identifier rapidement où se situe la latence ou l’échec (gateway vs service aval).

## Règles de nommage recommandées
- Routes HTTP: préfixe métier court + action (`auth.login`).
- Métriques: snake_case + unité explicite (`http_request_duration_ms`).
- Labels: limiter la cardinalité (pas d’IDs utilisateurs en labels).

## Prochaine étape (quand validée)
1. Documenter le stack tooling retenu.
2. Ajouter les configs Compose correspondantes.
3. Ajouter un guide de lecture des dashboards/traces.
