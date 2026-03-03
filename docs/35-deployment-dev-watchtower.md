# 35 - Déploiement DEV/staging avec Watchtower (Option 1)

## Positionnement
Cette stratégie est retenue pour la V1 **uniquement en DEV/staging**.

Objectif : simplifier l’exploitation quotidienne (auto-pull + restart) sans mettre en place de pipeline d’orchestration plus avancé.

## Fonctionnement
- `watchtower` tourne comme service Compose (profil `watchtower`).
- Il surveille périodiquement les images distantes.
- S’il détecte une image plus récente, il pull puis redémarre le conteneur ciblé.
- Mode retenu : `--label-enable` pour limiter la portée aux services explicitement marqués.

Dans cette stack, les cibles sont :
- `front-service`
- `auth-service`

## Activation
```bash
make up-watchtower
make logs-watchtower
```

## Désactivation
```bash
make down
make up
```

## Paramètres
- `WATCHTOWER_POLL_INTERVAL` (secondes) dans `.env`.
- Les services à surveiller sont contrôlés par le label :
  - `com.centurylinklabs.watchtower.enable=true`

## Limites et risques
- Watchtower requiert l’accès à `docker.sock` (surface sensible).
- Un tag mutable (`latest`, `dev`) peut introduire une version inattendue.
- Les redémarrages automatiques peuvent masquer l’absence de stratégie de déploiement maîtrisée.

## Recommandation production
Ne pas utiliser cette option en production sans garde-fous supplémentaires.
Préférer des déploiements explicitement pilotés, images versionnées immuables, contrôles de rollout/rollback.

## Checklist sécurité
- [ ] Usage limité DEV/staging.
- [ ] `docker.sock` monté en lecture seule.
- [ ] `--label-enable` activé.
- [ ] Seuls les services nécessaires sont labellisés.
