# 35 - Déploiement DEV/staging avec Watchtower

## Statut
Ce mode **n’est pas activé** dans la stack locale V1 courante.

Le repo `infra` privilégie désormais un flux explicite :
1. mettre à jour la référence d’image (`@sha256` recommandé),
2. `make pull`,
3. `make up`.

## Pourquoi
- Réduire la complexité opérationnelle locale.
- Éviter les mises à jour implicites automatiques.
- Garder un comportement reproductible proche d’un déploiement contrôlé.

## Si Watchtower est réintroduit plus tard
- le faire uniquement en DEV/staging,
- forcer `--label-enable`,
- conserver `docker.sock` en lecture seule,
- documenter précisément les services surveillés.
