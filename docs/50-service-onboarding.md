# 50 - Service onboarding

Checklist d’ajout d’un nouveau service dans `infra`.

## 1) Contrat API
- [ ] Définir le basepath : `/api/<service>`.
- [ ] Lister endpoints clés + statut auth (public/protégé).
- [ ] Vérifier la compatibilité avec la convention de StripPrefix.

## 2) Contrat runtime
- [ ] Ajouter `<SERVICE>_IMAGE` dans `.env.example`.
- [ ] Ajouter `<SERVICE>_INTERNAL_PORT` dans `.env.example`.
- [ ] Vérifier le port interne réellement exposé par le conteneur.

## 3) Routage Traefik
- [ ] Ajouter labels router `PathPrefix(`/api/<service>`)`.
- [ ] Ajouter middleware `StripPrefix` correspondant.
- [ ] Ajouter `loadbalancer.server.port` sur le port interne.
- [ ] Vérifier priorité de routes si conflit possible.

## 4) Health, logs, debug
- [ ] Exposer `/health` (ou documenter un équivalent).
- [ ] Vérifier logs exploitables en stdout/stderr.
- [ ] Mettre à jour `make health` si nécessaire.
- [ ] Si debug direct utile, créer un override dédié localhost (pas dans le core compose).

## 5) Sécurité
- [ ] Aucun `ports:` en mode core pour le service.
- [ ] Pas de secret hardcodé, uniquement via variables/env.
- [ ] Valider le principe « Traefik unique point d’entrée HTTP ».

## 6) Watchtower (si DEV/staging)
- [ ] Ajouter `com.centurylinklabs.watchtower.enable=true` si le service doit être auto-updaté.
- [ ] Vérifier que le tag d’image utilisé est cohérent avec la stratégie d’environnement.

## 7) Validation finale
- [ ] Test via Traefik (`curl http://localhost/api/<service>/...`).
- [ ] Mise à jour docs (`README` + sections concernées).
- [ ] Vérifier cohérence docs/config (pas d’écart entre description et compose).
