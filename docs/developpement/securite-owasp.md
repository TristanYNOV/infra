# Sécurité OWASP

## Objectif du document
Adapter l’OWASP Top 10 2025 au contexte Analyse Basket pour prioriser les contrôles sécurité applicatifs.

## Matrice OWASP Top 10 2025
| Catégorie OWASP | Risque pour Analyse Basket | Mesures existantes | Preuves ou contrôles | Limites actuelles | Améliorations prévues | Priorité |
|---|---|---|---|---|---|---|
| A01 Broken Access Control | Accès non autorisé aux timelines/panels privés | Guards, rôles, ownership | Tests API d’autorisation multi-profils | Couverture multi-utilisateurs à renforcer | Tests systématiques entre deux utilisateurs | Haute |
| A02 Security Misconfiguration | Mauvaise config Traefik/CORS/secrets/dashboard | Variables d’environnement, reverse proxy | Revue configuration infra | CORS non confirmé, dashboard public à vérifier | Checklist config prod + hardening | Haute |
| A03 Software Supply Chain Failures | Dépendances vulnérables / images compromises | Lockfiles, CI, GHCR | Vérification pipeline et provenance image | Pas d’audit régulier, pas de Trivy | `npm audit`, Dependabot/Renovate, scan images | Haute |
| A04 Cryptographic Failures | Secrets JWT/cookies/tokens mal gérés | bcrypt (à vérifier), JWT secret, refresh via cookie | Revue code auth + tests session | Stockage hash refresh token à vérifier | Rotation secrets + durcissement cookies | Haute |
| A05 Injection | Payloads JSON malveillants / entrées non sûres | Validation DTO, ORM/Drizzle/Mongoose | Tests payload invalides | Jeux d’attaque non systématisés | Campagne tests payloads malformés | Moyenne |
| A06 Insecure Design | Découpage sécurité insuffisant | Séparation front/auth/store, anonymisation | Revue architecture | Threat model non formalisé | Modélisation de menace formelle | Moyenne |
| A07 Authentication Failures | Brute force login, mauvaise révocation session | Login/logout/refresh/session | Tests fonctionnels auth | Pas de rate limiting connu | Rate limiting + politique mot de passe | Haute |
| A08 Software or Data Integrity Failures | Image/pipeline altéré, mauvais artefact déployé | GHCR, SemVer, digest `sha256` | Contrôle tag/digest avant déploiement | Signature image absente | Signature Cosign (ou équivalent) | Moyenne |
| A09 Security Logging and Alerting Failures | Incident non détecté rapidement | Logs d’échec, Uptime Kuma | Vérification journalisation et sondes | Alerting centralisé incomplet | Prometheus/Grafana + logs structurés | Moyenne |
| A10 Mishandling of Exceptional Conditions | Erreurs verbeuses, non gérées, fail-open | Validation, healthchecks, gestion erreurs NestJS | Tests d’erreurs API | Standardisation erreurs prod incomplète | Masquer stack traces et normaliser réponses | Moyenne |

## Points de contrôle à vérifier dans le code
- Refresh token opaque en cookie HttpOnly : À vérifier dans le code.
- Durées réelles access/refresh token : À vérifier dans le code.
- Configuration CORS explicite : À vérifier dans le code.
- Exposition dashboard Traefik en production : À vérifier.

## Synthèse des priorités sécurité
1. Mettre en place un rate limiting sur login.
2. Formaliser un audit dépendances régulier.
3. Ajouter un scan de sécurité des images Docker.
4. Renforcer les tests ownership multi-utilisateurs.
5. Définir une politique de backup/restauration.
6. Vérifier et durcir CORS/headers/cookies en production.
