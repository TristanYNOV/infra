# 50 - Service onboarding

Checklist d’ajout d’un nouveau service dans `infra`.

## 1) Contrat API
- [ ] Définir les préfixes réellement consommés par le front (ex: `/auth`, `/users`, `/me`).
- [ ] Lister endpoints clés + statut auth (public/protégé).
- [ ] Éviter les réécritures Traefik non nécessaires.

## 2) Contrat runtime
- [ ] Ajouter `<SERVICE>_IMAGE` dans `.env.example`.
- [ ] Pinner l’image par digest GHCR (`@sha256`) quand possible.
- [ ] Vérifier le port interne réellement exposé par le conteneur.

## 3) Routage Traefik
- [ ] Ajouter labels router `PathPrefix(...)` explicites.
- [ ] Ajouter `loadbalancer.server.port` sur le port interne réel.
- [ ] Vérifier priorité de routes si conflit possible.
- [ ] Garder Traefik comme unique point d’entrée HTTP.

## 4) Health et exploitation
- [ ] Exposer `/health` (ou équivalent documenté).
- [ ] Ajouter un healthcheck Compose si possible.
- [ ] Mettre à jour `make health` si nécessaire.
- [ ] Vérifier logs exploitables en stdout/stderr.

## 5) Sécurité
- [ ] Aucun `ports:` en mode core pour le service.
- [ ] Pas de secret hardcodé, uniquement via variables/env.
- [ ] Vérifier que les dépendances internes (DB, queue...) restent privées.

## 6) Validation finale
- [ ] Test via Traefik (`curl http://localhost/...`).
- [ ] Mise à jour docs (`README` + sections concernées).
- [ ] Vérifier cohérence docs/config (pas d’écart entre description et compose).
