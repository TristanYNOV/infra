# 50 - Service onboarding

Checklist d’ajout d’un nouveau service dans `infra`.

## 1) Contrat API
- [ ] Définir le basepath : `/api/<service>`.
- [ ] Lister endpoints clés et statut auth (public/protégé).

## 2) Contrat runtime
- [ ] Déclarer `SERVICE_IMAGE` dans `.env.example`.
- [ ] Déclarer `SERVICE_INTERNAL_PORT` dans `.env.example`.
- [ ] Vérifier le port interne réel du conteneur.

## 3) Routage Traefik
- [ ] Ajouter labels router `PathPrefix(`/api/<service>`)`.
- [ ] Ajouter middleware `StripPrefix`.
- [ ] Ajouter `loadbalancer.server.port` sur le port interne.
- [ ] Vérifier les priorités de route si conflit possible.

## 4) Health & logs
- [ ] Exposer un endpoint `/health` (ou équivalent documenté).
- [ ] Vérifier les logs lisibles en stdout/stderr.
- [ ] Ajouter une vérification dans `make health` si pertinent.

## 5) Sécurité
- [ ] Aucun `ports:` publié en mode core.
- [ ] Si debug direct nécessaire, le faire dans un override dédié localhost.
- [ ] Éviter secrets hardcodés; passer par variables d’environnement.

## 6) Validation
- [ ] Test via Traefik (`curl http://localhost/api/<service>/...`).
- [ ] Mise à jour documentation (`README` + docs concernées).
