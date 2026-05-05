# Checklist — Déploiement

## Objectif du document
Sécuriser un déploiement applicatif de bout en bout.

## Pré-déploiement
- [ ] Build validé
- [ ] Tests automatisés validés
- [ ] Images GHCR publiées
- [ ] Tags et digest vérifiés
- [ ] Variables `.env` mises à jour

## Déploiement
- [ ] `docker compose pull`
- [ ] `docker compose up -d`
- [ ] Vérification des conteneurs

## Post-déploiement
- [ ] Healthchecks (`/healthz`, `/health`, `/api/health`)
- [ ] Uptime Kuma au vert
- [ ] Tests critiques exécutés
