# Checklist — Sécurité OWASP

## Objectif du document
Vérifier les contrôles minimaux de sécurité applicative d’Analyse Basket à partir de l’OWASP Top 10.

## Informations de contrôle
- Date : À compléter
- Environnement : À compléter
- Contrôleur : À compléter
- Repo/service concerné : À compléter
- Version/tag/digest : À compléter

## A01 — Broken Access Control
- [ ] Ownership vérifié sur timelines.
- [ ] Ownership vérifié sur panels.
- [ ] Accès admin restreint.
- [ ] Ressources privées non accessibles par un autre utilisateur.
- [ ] Tests multi-utilisateurs réalisés.

## A02 — Security Misconfiguration
- [ ] Secrets absents du repo.
- [ ] Variables d’environnement utilisées.
- [ ] CORS vérifié.
- [ ] Security headers vérifiés.
- [ ] Dashboard Traefik non exposé publiquement en production.
- [ ] Bases de données non exposées publiquement.
- [ ] Erreurs prod non verbeuses.

## A03 — Software Supply Chain Failures
- [ ] Lockfiles présents.
- [ ] Versions Node/npm documentées.
- [ ] Dépendances critiques vérifiées.
- [ ] `npm audit` exécuté ou prévu.
- [ ] Dependabot/Renovate envisagé.
- [ ] Scan image Docker envisagé.
- [ ] Images GHCR identifiées.

## A04 — Cryptographic Failures
- [ ] Password hashé.
- [ ] JWT secret en variable d’environnement.
- [ ] Refresh token en cookie HttpOnly.
- [ ] Cookie Secure en production à vérifier.
- [ ] Durées de token documentées.
- [ ] Rotation des secrets prévue ou documentée.

## A05 — Injection
- [ ] DTO validés.
- [ ] Inputs utilisateur validés.
- [ ] Imports JSON validés.
- [ ] Pas de SQL brut non maîtrisé.
- [ ] Payloads invalides testés.
- [ ] Taille des payloads à vérifier.

## A06 — Insecure Design
- [ ] Séparation front/auth/store.
- [ ] Ressources privées par défaut.
- [ ] Anonymisation prévue pour contenus sensibles.
- [ ] Risques principaux documentés.
- [ ] Threat model minimal à créer ou compléter.

## A07 — Authentication Failures
- [ ] Login testé.
- [ ] Logout testé.
- [ ] Refresh token testé.
- [ ] Expiration token testée.
- [ ] Rate limiting login à ajouter ou vérifier.
- [ ] Politique mot de passe à préciser.
- [ ] Logs d’échec de connexion disponibles.

## A08 — Software and Data Integrity Failures
- [ ] CI active.
- [ ] Builds vérifiés.
- [ ] Images GHCR publiées.
- [ ] Digests `sha256` utilisés dans infra.
- [ ] Pas d’usage non maîtrisé de `latest`.
- [ ] Signature d’image à envisager.

## A09 — Security Logging and Alerting Failures
- [ ] Logs applicatifs disponibles.
- [ ] Logs d’échecs auth disponibles.
- [ ] Uptime Kuma configuré.
- [ ] Alerting à compléter.
- [ ] Prometheus/Grafana à compléter.
- [ ] Procédure incident documentée.

## A10 — Mishandling of Exceptional Conditions
- [ ] Erreurs API compréhensibles.
- [ ] Stack traces non exposées en production.
- [ ] Healthchecks disponibles.
- [ ] Erreurs de validation gérées.
- [ ] Timeouts et erreurs réseau à vérifier.
- [ ] Format d’erreur standardisé à améliorer si nécessaire.

## Résultat du contrôle
- Statut global : À compléter
- Risques principaux détectés : À compléter

## Actions de remédiation
| Risque | Contrôle manquant | Priorité | Action | Responsable | Statut |
|---|---|---|---|---|---|
| À compléter | À compléter | Haute / Moyenne / Basse | À compléter | À compléter | Ouvert / En cours / Clos |
