# Parcours utilisateur

## Objectif du document
Décrire les parcours clés d’usage d’Analyse Basket pour faciliter la prise en main et la validation fonctionnelle.

## Principes
- Parcours orientés usage réel.
- Étapes simples et progressives.
- Distinction claire entre fonctionnalités disponibles et évolutions prévues.

## Rôles utilisateurs
- Coach
- Analyste vidéo
- Assistant coach
- Étudiant STAPS
- Formateur
- Administrateur applicatif (selon fonctionnalités)
- Joueur consultant (à terme)

## Parcours 1 — Première connexion
- **Objectif du parcours** : accéder à son espace et démarrer l’application.
- **Acteur principal** : utilisateur connecté.
- **Pré-requis** : compte actif.
- **Étapes** : accéder à l’app, saisir identifiants, valider connexion, ouvrir espace d’analyse/ressources.
- **Résultat attendu** : session active et accès aux fonctionnalités autorisées.
- **Points de vigilance** : identifiants corrects, session valide.
- **Statut** : En place.

## Parcours 2 — Réaliser une première analyse vidéo
- **Objectif du parcours** : démarrer une analyse sur un support vidéo.
- **Acteur principal** : coach / analyste vidéo.
- **Pré-requis** : accès à la page d’analyse, support vidéo compatible.
- **Étapes** : ouvrir page analyse, charger/utiliser vidéo, lancer lecture, naviguer dans la timeline temporelle.
- **Résultat attendu** : premiers moments importants identifiés.
- **Points de vigilance** : qualité du support vidéo, fluidité de navigation.
- **Statut** : En place.

## Parcours 3 — Créer et sauvegarder une timeline
- **Objectif du parcours** : structurer une analyse dans le temps.
- **Acteur principal** : coach / analyste vidéo.
- **Pré-requis** : session active.
- **Étapes** : créer timeline, ajouter éléments, sauvegarder, recharger la timeline.
- **Résultat attendu** : timeline persistée et récupérable.
- **Points de vigilance** : vérifier confirmation de sauvegarde.
- **Statut** : En place.

## Parcours 4 — Créer et sauvegarder un panel
- **Objectif du parcours** : personnaliser les outils d’analyse.
- **Acteur principal** : coach / analyste vidéo.
- **Pré-requis** : session active.
- **Étapes** : créer panel, ajouter boutons (events/labels/stats), personnaliser, sauvegarder.
- **Résultat attendu** : panel disponible pour réutilisation.
- **Points de vigilance** : cohérence des éléments du panel.
- **Statut** : En place.

## Parcours 5 — Utiliser des événements et labels
- **Objectif du parcours** : enrichir l’analyse des actions observées.
- **Acteur principal** : coach / analyste vidéo.
- **Pré-requis** : panel/timeline disponibles.
- **Étapes** : déclencher événement, ajouter/activer label, consulter résultat dans l’analyse.
- **Résultat attendu** : contexte d’action enrichi.
- **Points de vigilance** : cohérence des labels avec les événements.
- **Statut** : En place.

## Parcours 6 — Utiliser les statistiques
- **Objectif du parcours** : synthétiser et interpréter les tendances.
- **Acteur principal** : coach / analyste vidéo.
- **Pré-requis** : données d’analyse disponibles.
- **Étapes** : consulter/configurer statistiques, interpréter les tendances, repérer moments clés.
- **Résultat attendu** : meilleure lecture du match.
- **Points de vigilance** : qualité des données d’entrée.
- **Statut** : En place (selon fonctionnalités disponibles).

## Parcours 7 — Retrouver une analyse sauvegardée
- **Objectif du parcours** : reprendre un travail existant.
- **Acteur principal** : utilisateur connecté.
- **Pré-requis** : ressources sauvegardées.
- **Étapes** : se connecter, ouvrir ressources, sélectionner timeline/panel, reprendre analyse.
- **Résultat attendu** : continuité de travail.
- **Points de vigilance** : droits d’accès, version de ressource.
- **Statut** : En place.

## Parcours 8 — Publier ou partager un panel
- **Objectif du parcours** : rendre un panel accessible selon règles métier.
- **Acteur principal** : utilisateur autorisé.
- **Pré-requis** : panel existant, fonctionnalité disponible.
- **Étapes** : sélectionner panel, choisir publication/partage, vérifier données visibles, confirmer.
- **Résultat attendu** : panel partagé selon règles.
- **Points de vigilance** : distinction privé/public, données sensibles.
- **Statut** : Selon disponibilité de la fonctionnalité.

## Parcours 9 — Anonymiser un contenu sensible
- **Objectif du parcours** : protéger l’identité numérique avant diffusion.
- **Acteur principal** : utilisateur auteur de l’analyse.
- **Pré-requis** : contenu à anonymiser.
- **Étapes** : identifier données sensibles, appliquer/vérifier anonymisation, contrôler résultat, partager si conforme.
- **Résultat attendu** : contenu diffusé avec exposition réduite des données sensibles.
- **Points de vigilance** : vérifier le rendu final.
- **Statut** : En place (à vérifier selon écran exact).

## Parcours 10 — Consulter l’état de l’application
- **Objectif du parcours** : comprendre rapidement si un service est indisponible.
- **Acteur principal** : tout utilisateur.
- **Pré-requis** : accès à la page de statut.
- **Étapes** : ouvrir status page, vérifier état des services, identifier éventuelle indisponibilité.
- **Résultat attendu** : diagnostic simple côté utilisateur.
- **Points de vigilance** : interprétation des statuts.
- **Statut** : En place.

## Parcours administrateur
- **Objectif du parcours** : gérer des opérations d’administration (si disponible).
- **Acteur principal** : administrateur applicatif.
- **Pré-requis** : droits admin.
- **Étapes** : consulter actions admin, exécuter action autorisée, contrôler résultat.
- **Résultat attendu** : action admin conforme aux droits.
- **Points de vigilance** : sécurité et traçabilité.
- **Statut** : À compléter.

## Parcours futurs
- Extraction de séquences vidéo.
- Association d’une analyse à un club.
- Association d’une analyse à une équipe.
- Association d’une analyse à des joueurs.
- Consultation joueur.
- Statistiques avancées.

## Tableau de synthèse
| ID | Parcours | Acteur | Priorité | Fonctionnalités concernées | Statut | Commentaire |
|---|---|---|---|---|---|---|
| P-01 | Première connexion | Utilisateur connecté | Haute | Authentification, session | En place | Point d’entrée |
| P-02 | Première analyse vidéo | Coach/Analyste | Haute | Page analyse, vidéo | En place | Base usage produit |
| P-03 | Timeline | Coach/Analyste | Haute | Création/sauvegarde timeline | En place | Critère MVP |
| P-04 | Panel | Coach/Analyste | Haute | Création/sauvegarde panel | En place | Personnalisation |
| P-05 | Events + labels | Coach/Analyste | Haute | Événements, labels | En place | Enrichissement contexte |
| P-06 | Statistiques | Coach/Analyste | Moyenne | Stats | En place (selon disponibilité) | À confirmer détail |
| P-07 | Reprise analyse | Utilisateur connecté | Haute | Ressources sauvegardées | En place | Continuité |
| P-08 | Partage/publication panel | Utilisateur autorisé | Moyenne | Publication/partage | Selon disponibilité | Règles métier |
| P-09 | Anonymisation | Utilisateur auteur | Haute | Anonymisation | En place (à confirmer) | Vérification manuelle |
| P-10 | État application | Tout utilisateur | Moyenne | Status page | En place | Diagnostic disponibilité |
| P-11 | Parcours admin | Administrateur | Moyenne | Fonctions admin | À compléter | Détails non confirmés |
| P-12 | Parcours futurs | Divers | Basse/Future | FFmpeg, club/équipe/joueurs | Prévu à terme | Hors MVP |

## Informations à compléter
- Détail exact des écrans administrateur disponibles.
- Niveau de disponibilité exact de certaines fonctions de publication/export selon version.
