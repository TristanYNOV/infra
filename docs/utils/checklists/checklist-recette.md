# Checklist — Recette fonctionnelle

## Objectif du document
Valider les parcours fonctionnels critiques avant mise en production ou avant validation d’une évolution importante.

## Informations de recette
- Date : À compléter
- Version : À compléter
- Environnement : À compléter
- Testeur : À compléter
- Navigateur : À compléter
- Données de test : À compléter
- Périmètre testé : À compléter

## Authentification
- [ ] Inscription utilisateur.
- [ ] Login.
- [ ] Récupération du profil `/me`.
- [ ] Refresh token.
- [ ] Logout.
- [ ] Session expirée correctement gérée.
- [ ] Accès admin restreint si applicable.

## Analyse vidéo
- [ ] Accès à la page analyse.
- [ ] Chargement ou utilisation d’une vidéo.
- [ ] Lecture / pause.
- [ ] Navigation dans la vidéo.
- [ ] Raccourcis clavier principaux.
- [ ] L’analyse ne nécessite pas de stockage vidéo serveur par défaut.

## Timelines
- [ ] Création timeline.
- [ ] Modification timeline.
- [ ] Sauvegarde timeline.
- [ ] Récupération timeline.
- [ ] Suppression timeline si disponible.
- [ ] Export timeline si disponible.
- [ ] Copy timeline si disponible.

## Panels
- [ ] Création panel.
- [ ] Modification panel.
- [ ] Sauvegarde panel.
- [ ] Récupération panel.
- [ ] Panel privé par défaut.
- [ ] Publication panel si disponible.
- [ ] Export panel si disponible.
- [ ] Copy panel si disponible.

## Events, labels et statistiques
- [ ] Création event.
- [ ] Déclenchement event.
- [ ] Création label.
- [ ] Association label/event.
- [ ] Création stat.
- [ ] Statistique affichée correctement.
- [ ] Cas d’usage avec plusieurs labels.
- [ ] Cas d’usage avec plusieurs events.

## Sauvegarde et récupération
- [ ] Sauvegarde globale cohérente.
- [ ] Ressources récupérables après reconnexion.

## Export, copie et publication
- [ ] Export fonctionnel (si disponible).
- [ ] Copy fonctionnelle (si disponible).
- [ ] Publication conforme aux règles métier (si disponible).

## Anonymisation
- [ ] Contenu sensible identifié.
- [ ] Anonymisation appliquée.
- [ ] Rendu anonymisé vérifié.
- [ ] Ressource privée conservée si non publiée.
- [ ] Utilisateur averti avant partage/publication si nécessaire.

## Droits d’accès
- [ ] Un utilisateur ne peut pas modifier une ressource d’un autre utilisateur.
- [ ] Un utilisateur ne peut pas supprimer une ressource d’un autre utilisateur.
- [ ] Un panel privé n’est pas visible par un autre utilisateur.
- [ ] Un panel public respecte les règles de lecture prévues.
- [ ] Les droits admin sont restreints.

## Exploitation
- [ ] Healthcheck front.
- [ ] Healthcheck auth.
- [ ] Healthcheck analysis-store.
- [ ] Uptime Kuma au vert.
- [ ] Aucune erreur critique dans les logs.

## Résultat de recette
Statuts possibles : OK / KO / Bloqué / Non applicable / À retester

| Parcours | Statut | Commentaire | Ticket associé | Décision |
|---|---|---|---|---|
| À compléter | OK / KO / Bloqué / Non applicable / À retester | À compléter | À compléter | Go / No Go / À retester |
