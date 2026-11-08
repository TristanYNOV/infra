# Parcours utilisateur

## Objectif du document
Décrire les parcours clés d'usage d'Action Board / Analyse Basket et fournir un guide rapide pour réaliser une première analyse vidéo.

## Guide rapide - Comment faire une analyse ?

### Prérequis
- Avoir un compte utilisateur.
- Être connecté à l'application.
- Disposer d'une vidéo locale lisible par le navigateur.
- Avoir une idée des événements, labels ou statistiques à observer.

### Étapes courtes
1. Se connecter.
2. Ouvrir l'espace d'analyse avec la route `/analyse`.
3. Charger une vidéo depuis son ordinateur.
4. Créer un nouveau panel ou charger un panel existant.
5. Ajouter les boutons utiles : événements, labels, statistiques.
6. Créer ou ouvrir une timeline.
7. Lancer la vidéo.
8. Déclencher les événements au bon moment.
9. Ajouter les labels nécessaires pour qualifier les actions.
10. Vérifier la timeline et ajuster si besoin.
11. Sauvegarder la timeline.
12. Sauvegarder le panel si sa configuration doit être réutilisée.
13. Exporter en JSON si une copie locale est nécessaire.

### Checklist avant de terminer
- La timeline porte un nom clair.
- Le panel porte un nom clair.
- Les occurrences principales sont présentes.
- Les labels sont cohérents.
- Les statistiques utiles ont été vérifiées.
- La timeline est sauvegardée en ligne.
- Le panel est sauvegardé ou exporté.
- Les données sensibles ont été retirées ou anonymisées si la ressource doit être partagée.
- La vidéo source reste conservée côté utilisateur.

### Mini FAQ
| Question | Réponse |
|---|---|
| La vidéo est-elle envoyée au serveur ? | Non dans le fonctionnement actuel observé : elle est chargée localement dans le navigateur. |
| Puis-je rendre une timeline publique ? | Non côté usage actuel documenté : les timelines sont privées. |
| Puis-je partager un panel ? | Oui si le panel est enregistré avec une visibilité publique. |
| Puis-je importer un panel ou une timeline ? | Oui via un fichier JSON validé par l'application. |
| Que faire si ma session expire ? | Se reconnecter, puis recharger ou sauvegarder de nouveau si nécessaire. |

### Erreurs fréquentes
| Problème | Action rapide |
|---|---|
| La page `/analyse` refuse l'accès | Vérifier la connexion et les droits de licence. |
| Le fichier vidéo ne se lit pas | Essayer un format compatible navigateur. |
| La sauvegarde échoue | Vérifier la session, consulter la page de statut, puis réessayer. |
| L'import est refusé | Vérifier qu'il s'agit d'un JSON exporté par Action Board. |
| Un panel public est introuvable | Vérifier qu'il est réellement public et que l'utilisateur est connecté. |

## Principes des parcours
- Les parcours décrivent l'usage réel observable dans le code.
- Les fonctionnalités non prêtes sont explicitement marquées comme prévues ou à confirmer.
- Les étapes restent orientées utilisateur, sans détail technique inutile.

## Rôles utilisateurs
- Coach.
- Analyste vidéo.
- Assistant coach.
- Étudiant ou formateur.
- Administrateur applicatif pour les opérations de gestion prévues côté backend.
- Joueur consultant : prévu à terme, non confirmé dans l'interface actuelle.

## Parcours 1 - Première connexion
| Élément | Description |
|---|---|
| Objectif | Accéder à l'espace connecté |
| Acteur | Utilisateur |
| Pré-requis | Compte actif |
| Étapes | Ouvrir l'application, ouvrir la connexion, saisir email/mot de passe, valider |
| Résultat attendu | Session active, arrivée sur l'espace connecté |
| Statut | En place |

## Parcours 2 - Réaliser une première analyse vidéo
| Élément | Description |
|---|---|
| Objectif | Démarrer une analyse à partir d'une vidéo locale |
| Acteur | Coach ou analyste |
| Pré-requis | Session active, vidéo disponible |
| Étapes | Ouvrir `/analyse`, charger une vidéo, lancer la lecture, utiliser le panel et la timeline |
| Résultat attendu | Premières occurrences créées dans la timeline |
| Statut | En place |

## Parcours 3 - Créer et sauvegarder une timeline
| Élément | Description |
|---|---|
| Objectif | Structurer l'observation dans le temps |
| Acteur | Utilisateur connecté |
| Pré-requis | Session active |
| Étapes | Nommer la timeline, créer des occurrences, vérifier le timing, sauvegarder |
| Résultat attendu | Timeline persistée et récupérable |
| Statut | En place |

## Parcours 4 - Créer et sauvegarder un panel
| Élément | Description |
|---|---|
| Objectif | Préparer une grille d'analyse réutilisable |
| Acteur | Utilisateur connecté |
| Pré-requis | Session active |
| Étapes | Créer panel, ajouter événements/labels/stats, configurer visibilité, sauvegarder |
| Résultat attendu | Panel disponible pour une future analyse |
| Statut | En place |

## Parcours 5 - Importer une ressource
| Élément | Description |
|---|---|
| Objectif | Réutiliser une timeline ou un panel exporté |
| Acteur | Utilisateur connecté |
| Pré-requis | Fichier JSON compatible |
| Étapes | Ouvrir import/export, choisir le fichier, laisser l'application valider, charger la ressource |
| Résultat attendu | Ressource importée dans l'espace courant |
| Statut | En place |

## Parcours 6 - Exporter une ressource
| Élément | Description |
|---|---|
| Objectif | Conserver ou transmettre une copie JSON |
| Acteur | Utilisateur connecté |
| Pré-requis | Timeline ou panel prêt |
| Étapes | Ouvrir import/export, lancer l'export, récupérer le fichier téléchargé |
| Résultat attendu | Fichier JSON local |
| Statut | En place |

## Parcours 7 - Retrouver une analyse sauvegardée
| Élément | Description |
|---|---|
| Objectif | Reprendre un travail existant |
| Acteur | Utilisateur connecté |
| Pré-requis | Ressource sauvegardée |
| Étapes | Ouvrir la recherche distante, choisir une timeline ou un panel, confirmer le remplacement si nécessaire |
| Résultat attendu | Travail rechargé dans l'interface |
| Statut | En place |

## Parcours 8 - Publier ou partager un panel
| Élément | Description |
|---|---|
| Objectif | Rendre une grille d'analyse réutilisable |
| Acteur | Utilisateur connecté |
| Pré-requis | Panel existant |
| Étapes | Choisir une visibilité publique si proposée, sauvegarder, vérifier les données visibles |
| Résultat attendu | Panel public accessible aux utilisateurs autorisés |
| Statut | En place côté modèle et API ; à valider selon l'écran exact |

## Parcours 9 - Protéger les données sensibles
| Élément | Description |
|---|---|
| Objectif | Limiter l'exposition des données personnelles |
| Acteur | Auteur de la ressource |
| Pré-requis | Ressource contenant des noms ou informations sensibles |
| Étapes | Renommer les éléments sensibles, utiliser les options d'anonymisation disponibles, vérifier avant export/publication |
| Résultat attendu | Ressource plus sûre à conserver ou partager |
| Statut | Partiel, à valider selon les écrans |

## Parcours 10 - Consulter l'état de l'application
| Élément | Description |
|---|---|
| Objectif | Comprendre si une indisponibilité vient d'un service |
| Acteur | Tout utilisateur |
| Pré-requis | Accès à la page de statut |
| Étapes | Ouvrir le domaine de statut Uptime Kuma, vérifier les services principaux |
| Résultat attendu | Diagnostic simple de disponibilité |
| Statut | En place côté infra |

## Parcours administrateur
Le backend `auth-service` contient des routes d'administration pour lister, modifier et demander la suppression d'utilisateurs. Dans l'infra actuelle, les labels Traefik ne routent pas publiquement `/admin/*`. Ce parcours est donc à confirmer avant documentation utilisateur opérationnelle.

## Parcours prévus ou indisponibles
| Parcours | Statut actuel |
|---|---|
| Club | Route front présente, écran indisponible |
| Équipes | Route front présente, écran indisponible |
| Joueurs | Route front présente, écran indisponible |
| Tournois | Route front présente, écran indisponible |
| Matchs | Route front présente, écran indisponible |
| Consultation joueur | Prévue à terme |
| Données club dans les droits analysis-store | Modèle technique présent, claims non alimentés actuellement |

## Tableau de synthèse
| ID | Parcours | Priorité | Statut | Commentaire |
|---|---|---|---|---|
| P-01 | Première connexion | Haute | En place | Accès aux fonctions protégées |
| P-02 | Première analyse vidéo | Haute | En place | Vidéo locale + timeline + panel |
| P-03 | Sauvegarde timeline | Haute | En place | Timeline privée |
| P-04 | Sauvegarde panel | Haute | En place | Visibilité privée/publique/club côté modèle |
| P-05 | Import | Moyenne | En place | Validation côté analysis-store |
| P-06 | Export | Moyenne | En place | Export JSON local |
| P-07 | Reprise d'analyse | Haute | En place | Chargement distant |
| P-08 | Panel public | Moyenne | En place à valider UX | Ne concerne pas les timelines publiques |
| P-09 | Anonymisation | Moyenne | Partiel | Contrôle humain nécessaire |
| P-10 | Page de statut | Moyenne | En place infra | Uptime Kuma |
| P-11 | Admin | Moyenne | À confirmer | Backend présent, route publique non exposée |
| P-12 | Club/équipe/joueurs/matchs | Basse | Prévu/indisponible | Routes front non fonctionnelles |
