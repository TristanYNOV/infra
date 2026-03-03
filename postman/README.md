# Postman usage (infra)

La collection Postman API est générée/maintenue dans le repo `auth-service`.
Ce dossier documente uniquement la stratégie d’exécution locale avec `infra`.

## Environnements recommandés

### 1) Via Traefik (par défaut)
- `baseUrl = http://localhost`
- Exemple endpoint auth: `{{baseUrl}}/api/auth/login`

Usage:
- reproduit le comportement réel attendu côté front,
- valide le routage gateway + StripPrefix.

### 2) Direct auth (debug)
- `baseUrl = http://127.0.0.1:${AUTH_HOST_PORT}`
- Exemple endpoint auth (sans préfixe gateway): `{{baseUrl}}/login`

Usage:
- troubleshooting rapide du service auth isolé,
- nécessite `make up-direct`.

## Bonnes pratiques
- Préférer l’environnement “via Traefik” pour les tests d’intégration.
- Réserver “direct” au debug ponctuel.
- Vérifier la cohérence des paths (avec ou sans `/api/auth`) selon l’environnement.
