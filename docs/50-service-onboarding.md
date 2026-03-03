# 50 - Service onboarding checklist

Checklist à suivre pour intégrer un nouveau microservice dans `infra`.

## 1) Identité du service
- [ ] Nom de service Docker clair (`<name>-service`).
- [ ] Repo propriétaire identifié.
- [ ] Owner technique nommé.

## 2) Contrat réseau
- [ ] Port interne documenté (`<SERVICE>_INTERNAL_PORT`).
- [ ] Endpoint health disponible (ex: `/health`).
- [ ] Pas de publication hôte en mode core.

## 3) Routage Traefik
- [ ] Basepath définie: `/api/<service>`.
- [ ] Router Traefik ajouté avec règle `PathPrefix(`/api/<service>`)`.
- [ ] Middleware `StripPrefix` configuré.
- [ ] Priorité définie pour éviter conflit avec router front.
- [ ] Service Traefik pointe vers le bon port interne.

## 4) Variables d’environnement
- [ ] Image/tag ajoutés à `.env.example`.
- [ ] Ports placeholders ajoutés si nécessaire.
- [ ] Documentation mise à jour (`docs/30-local-dev.md` + README).

## 5) Sécurité & auth (préparation)
- [ ] Classifier les endpoints publics vs protégés.
- [ ] Préparer la compatibilité future avec validation JWT au gateway.
- [ ] Vérifier l’absence d’exposition directe non souhaitée.

## 6) Tests d’intégration minimale
- [ ] Test via Traefik (`/api/<service>/...`) en curl/Postman.
- [ ] Vérification `make health`.
- [ ] Logs Traefik et service inspectés sans erreur bloquante.
