# Checklist — Déploiement

## Objectif du document
Sécuriser un déploiement applicatif de bout en bout depuis le repo `infra`.

## Informations de déploiement
- Date : À compléter
- Environnement : À compléter
- Responsable : À compléter
- Service(s) concerné(s) : À compléter
- Version ou tag : À compléter
- Digest image : À compléter
- Ticket / changelog associé : À compléter

## Pré-déploiement
- [ ] Ticket ou changement identifié.
- [ ] Version à déployer validée.
- [ ] Build validé.
- [ ] Tests automatisés validés.
- [ ] Recette minimale préparée.
- [ ] Images GHCR publiées.
- [ ] Tags vérifiés.
- [ ] Digests vérifiés.
- [ ] Ancien digest conservé pour rollback.
- [ ] Variables `.env` mises à jour.
- [ ] Secrets non exposés dans le repo.
- [ ] Sauvegarde BDD réalisée si nécessaire.
- [ ] Fenêtre de déploiement validée si nécessaire.

## Images et versions
- [ ] Image front-service confirmée.
- [ ] Image auth-service confirmée.
- [ ] Image analysis-store-service confirmée.
- [ ] Correspondance tag/digest vérifiée.

## Configuration
- [ ] Variables d’environnement vérifiées.
- [ ] Secrets contrôlés.
- [ ] Routes Traefik cohérentes avec la version.

## Déploiement
- [ ] `make pull` exécuté si disponible.
- [ ] Sinon `docker compose pull` exécuté.
- [ ] `make up` exécuté si disponible.
- [ ] Sinon `docker compose up -d` exécuté.
- [ ] Vérification des conteneurs avec `docker compose ps`.
- [ ] Vérification des logs des services modifiés.

## Vérifications techniques
- [ ] Vérification des routes Traefik.
- [ ] Vérification que les bases ne sont pas exposées publiquement.
- [ ] Vérification que le dashboard Traefik n’est pas exposé publiquement en production.
- [ ] `front-service` : `/healthz`.
- [ ] `auth-service` : `/health`.
- [ ] `analysis-store-service` : `/api/health`.

## Vérifications fonctionnelles
- [ ] Page d’accueil accessible.
- [ ] Login fonctionnel.
- [ ] Logout fonctionnel.
- [ ] Sauvegarde timeline fonctionnelle.
- [ ] Sauvegarde panel fonctionnelle.
- [ ] Export/copy si concerné.
- [ ] Publication/anonymisation si concerné.

## Monitoring
- [ ] Uptime Kuma au vert.
- [ ] Absence d’alerte critique immédiate.

## Rollback
- [ ] Ancien digest disponible.
- [ ] Procédure de rollback identifiée.
- [ ] Critères de rollback définis.
- [ ] Retour arrière testé ou documenté si déclenché.

## Validation finale
- [ ] Journal de version mis à jour.
- [ ] Incident ou anomalie documenté si échec.

| Élément | Résultat | Commentaire | Validé par | Date |
|---|---|---|---|---|
| À compléter | OK / KO / À retester | À compléter | À compléter | À compléter |
