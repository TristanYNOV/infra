# Sécurité OWASP

## Objectif du document
Cartographier les risques OWASP et les mesures de maîtrise pour Analyse Basket.

## Matrice OWASP
| Risque OWASP | Risque dans Analyse Basket | Mesures existantes | Preuves attendues | Limites / améliorations prévues |
|---|---|---|---|---|
| Broken Access Control | Accès non autorisé aux timelines/panels | Guards + rôles admin/user + ownership | Tests API d’autorisation | Renforcer revues de droits |
| Security Misconfiguration | Mauvaise config Traefik/CORS/secrets | Variables d’environnement + reverse proxy | Revue conf prod | Dashboard Traefik non public à confirmer |
| Software Supply Chain Failures | Dépendances compromises | Lockfiles + CI + GHCR | Rapports audit dépendances | Politique audit régulière À compléter |
| Cryptographic Failures | Faiblesse JWT/password/refresh token | Hash password + JWT secret + cookies sécurisés | Config + tests auth | Rotation secret à formaliser |
| Injection | Entrées mal validées | DTO + validation, pas de SQL brut attendu | Tests payload malicieux | Campagne pentest À compléter |
| Insecure Design | Risques non anticipés | Architecture séparée front/auth/store | Modèle de menace minimal | Threat modeling formalisé À compléter |
| Authentication Failures | Session/token mal gérés | Expiration + refresh + logout | Tests login/refresh/logout | Rate limiting à vérifier |
| Software/Data Integrity Failures | Pipeline ou images altérées | CI/CD + images immuables | Traces build + digest | Signature d’images À compléter |
| Security Logging and Alerting Failures | Alertes insuffisantes | Logs applicatifs + Uptime Kuma | Journal incidents | Alerting centralisé À compléter |
| Mishandling of Exceptional Conditions | Erreurs verbeuses en prod | Gestion d’erreurs + healthchecks | Vérification réponses prod | Standardiser format d’erreur |
