# Cahier de recette

## Objectif du document
Fournir une checklist manuelle de validation fonctionnelle avant mise en production.

## Méthode de recette
- Exécuter les scénarios critiques sur environnement ciblé.
- Tracer le résultat pour chaque cas.
- Bloquer la mise en production en cas d’échec sur scénario prioritaire.

## Environnements concernés
- Local repo isolé.
- Intégration via Docker Compose (`infra`).
- Préproduction/production (si applicable) : À compléter.

## Statuts possibles
- À tester
- Validé
- Échec
- Bloqué
- Non applicable

## Scénarios de recette
| ID | Type | Priorité | Scénario | Résultat attendu | Statut | Commentaire |
|---|---|---|---|---|---|---|
| REC-01 | Auth | Haute | Inscription utilisateur | Compte créé selon règles | À tester | À compléter |
| REC-02 | Auth | Haute | Login utilisateur | Session ouverte | À tester | À compléter |
| REC-03 | Auth | Haute | Récupération `/me` | Profil courant retourné | À tester | À compléter |
| REC-04 | Auth | Haute | Refresh token | Nouveau token d’accès émis | À tester | À compléter |
| REC-05 | Auth | Haute | Logout | Session invalidée | À tester | À compléter |
| REC-06 | Métier | Haute | Création timeline | Timeline créée | À tester | À compléter |
| REC-07 | Métier | Haute | Sauvegarde timeline | Données persistées | À tester | À compléter |
| REC-08 | Métier | Haute | Modification timeline | Mise à jour persistée | À tester | À compléter |
| REC-09 | Métier | Haute | Création panel | Panel créé | À tester | À compléter |
| REC-10 | Métier | Haute | Sauvegarde panel | Panel persisté | À tester | À compléter |
| REC-11 | Métier | Haute | Modification panel | Mise à jour persistée | À tester | À compléter |
| REC-12 | Sécurité | Haute | Panel privé non visible par autre utilisateur | Accès refusé | À tester | À compléter |
| REC-13 | Métier | Moyenne | Panel public consultable selon règle | Consultation possible selon droits | À tester | À compléter |
| REC-14 | Métier | Moyenne | Publication panel | État publié conforme | À tester | À compléter |
| REC-15 | Sécurité | Haute | Anonymisation panel | Données sensibles masquées | À tester | À compléter |
| REC-16 | Métier | Moyenne | Export timeline | Export généré | À tester | À compléter |
| REC-17 | Métier | Moyenne | Export panel | Export généré | À tester | À compléter |
| REC-18 | Métier | Moyenne | Copy timeline/panel | Copie créée | À tester | À compléter |
| REC-19 | Sécurité | Haute | Interdiction modification ressource d’autrui | Requête refusée | À tester | À compléter |
| REC-20 | UX | Haute | Page analyse utilisable | Parcours principal fluide | À tester | À compléter |
| REC-21 | Données | Haute | Chargement vidéo sans stockage serveur par défaut | Analyse possible sans upload persistant | À tester | À compléter |
| REC-22 | Exploitation | Moyenne | Status page Uptime Kuma | Services au vert | À tester | À compléter |
| REC-23 | Exploitation | Haute | Healthcheck front | `/healthz` OK | À tester | À compléter |
| REC-24 | Exploitation | Haute | Healthcheck auth | `/health` OK | À tester | À compléter |
| REC-25 | Exploitation | Haute | Healthcheck analysis-store | `/api/health` OK | À tester | À compléter |
| REC-26 | Exploitation | Haute | Déploiement infra après MAJ image | Services redéployés sans régression critique | À tester | À compléter |
