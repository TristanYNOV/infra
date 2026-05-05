# Flux analysis-store

## Objectif du document
Documenter les flux fonctionnels du service `analysis-store-service` pour la gestion des timelines et panels.

## Rôle du service
Le service `analysis-store-service` gère la persistance et les règles métier associées aux ressources d’analyse vidéo.

## Ressources gérées
- Timelines
- Panels
- Imports / validation
- Exports
- Copy
- Publication
- Anonymisation

## Exposition des endpoints
- En interne service : endpoints `/api/...`
- En production via Traefik : `/analysis/api/...` (avec suppression du préfixe `/analysis` avant routage interne)

## Flux texte — sauvegarde timeline/panel
```txt
1. L’utilisateur édite une timeline ou un panel dans le front.
2. Le front construit un payload JSON conforme au contrat attendu.
3. Le front appelle l’endpoint analysis-store exposé via Traefik.
4. Traefik retire le préfixe /analysis en production.
5. L’analysis-store vérifie l’identité et les droits.
6. L’analysis-store valide le payload.
7. L’analysis-store persiste la ressource en PostgreSQL.
8. Le front reçoit la ressource sauvegardée et met à jour son état local.
```

## Flux fonctionnels complémentaires
### Validation d’import
- `POST /api/imports/timelines/validate` : contrôle format et cohérence import timeline.
- `POST /api/imports/panels/validate` : contrôle format et cohérence import panel.

### Création / mise à jour
- Création timeline : `POST /api/timelines`.
- Mise à jour timeline : `PUT/PATCH /api/timelines/:id` (à vérifier).
- Création panel : `POST /api/panels`.
- Mise à jour panel : `PUT/PATCH /api/panels/:id` (à vérifier).

### Export, copy, publication, anonymisation
- Export timeline/panel via endpoints dédiés.
- Copy timeline/panel pour dupliquer une ressource.
- Publication/anonymisation selon règles métier et droits utilisateur.

## Endpoints connus
| Endpoint | Usage | Statut de vérification |
|---|---|---|
| `/api/imports/timelines/validate` | Validation import timeline | À vérifier dans le code |
| `/api/imports/panels/validate` | Validation import panel | À vérifier dans le code |
| `/api/timelines` | CRUD timeline | Partiellement confirmé |
| `/api/panels` | CRUD panel | Partiellement confirmé |
| `/api/timelines/:id/export` | Export timeline | À vérifier dans le code |
| `/api/panels/:id/export` | Export panel | À vérifier dans le code |
| `/api/timelines/:id/copy` | Duplication timeline | À vérifier dans le code |
| `/api/panels/:id/copy` | Duplication panel | À vérifier dans le code |

## Règles de sécurité métier
- Ownership obligatoire : un utilisateur ne modifie que ses ressources.
- Ressource privée par défaut.
- Panel public consultable selon règles de publication en vigueur.
- Anonymisation des contenus sensibles avant diffusion externe.
- Interdiction de modification/suppression des ressources d’un autre utilisateur.

## Points de vigilance
- Cohérence front/prod entre `/analysis/api/...` et `/api/...`.
- Immutabilité de certains champs (notamment `id`).
- Nettoyage/anonymisation des ressources lors de suppression utilisateur.
- Validation JSON stricte avant sauvegarde.
- Gestion explicite des erreurs de validation, droits et persistance.

## À compléter
- Méthodes HTTP exactes des endpoints de mise à jour.
- Règles détaillées de publication et visibilité publique des panels.
