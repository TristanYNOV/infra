# Manuel utilisateur

## Objectif du document
Aider un utilisateur final à utiliser Action Board / Analyse Basket pour réaliser une analyse vidéo, organiser ses observations, sauvegarder ses ressources et les réutiliser.

## Public concerné
- Coach.
- Analyste vidéo.
- Assistant coach.
- Étudiant ou formateur.
- Administrateur applicatif, uniquement pour les fonctions de gestion prévues côté backend.

Les parcours club, équipes, joueurs, tournois et matchs sont visibles dans la navigation applicative mais affichent actuellement un écran d'indisponibilité. Ils ne doivent pas être considérés comme des fonctionnalités prêtes.

## Présentation rapide
Action Board est une application web d'analyse vidéo sportive. Elle s'appuie sur trois éléments principaux :

| Élément | Rôle |
|---|---|
| Vidéo | Support local chargé dans le navigateur pour lire, mettre en pause, ralentir et naviguer dans l'action |
| Timeline | Fil chronologique qui conserve les occurrences créées pendant l'analyse |
| Panel | Grille personnalisée de boutons d'analyse : événements, labels et statistiques |

Les vidéos ne sont pas stockées sur le serveur dans le fonctionnement actuel observé. L'utilisateur charge un fichier vidéo depuis son poste et les données sauvegardées concernent les timelines, panels et métadonnées d'analyse.

## Pré-requis
1. Disposer d'un navigateur récent.
2. Disposer d'un compte utilisateur.
3. Avoir accès à l'application.
4. Préparer une vidéo compatible avec le navigateur.
5. Prévoir une méthode d'analyse : événements à observer, labels utiles, statistiques à suivre.

## Arriver sur l'application
1. Ouvrir l'URL de l'application.
2. Consulter la page d'accueil ou les pages d'information si besoin.
3. Utiliser le bouton de connexion ou d'inscription.
4. Après connexion, accéder à l'espace d'accueil puis à la page d'analyse.

Les routes publiques incluent notamment l'accueil, les fonctionnalités, les tarifs, la FAQ, le contact, les CGU et la confidentialité.

## Créer un compte
1. Ouvrir la fenêtre d'inscription.
2. Saisir une adresse email, un mot de passe et, si demandé, un pseudo.
3. Valider l'inscription.
4. L'application connecte l'utilisateur après création du compte si l'inscription réussit.

Bonnes pratiques :
- choisir un mot de passe unique ;
- éviter de saisir des données sensibles inutiles dans le pseudo ;
- conserver l'accès à l'adresse email utilisée.

## Se connecter
1. Ouvrir la fenêtre de connexion.
2. Saisir l'email et le mot de passe.
3. Valider.
4. Vérifier l'arrivée sur l'espace connecté.

La session utilise un access token en mémoire et un cookie de refresh HttpOnly côté navigateur. Si la session expire, l'application tente un refresh ; en cas d'échec, il faut se reconnecter.

## Ouvrir l'espace d'analyse
1. Se connecter.
2. Aller sur la page `/analyse`.
3. Vérifier que la page d'analyse affiche les zones principales : vidéo, timeline et panel.
4. Si l'accès est refusé, vérifier la session et les droits nécessaires.

## Charger une vidéo
1. Dans la zone vidéo, choisir l'action de chargement ou de remplacement de vidéo.
2. Sélectionner un fichier vidéo local.
3. Attendre le chargement des métadonnées.
4. Lancer la lecture pour vérifier que le fichier est lisible.

Points importants :
- la vidéo reste côté navigateur ;
- changer de vidéo peut réinitialiser l'état vidéo courant ;
- si la lecture échoue, essayer un format compatible avec le navigateur.

## Utiliser le lecteur vidéo
Le lecteur permet de :
- lire et mettre en pause ;
- se déplacer dans la vidéo ;
- ajuster la vitesse entre les limites prévues par l'interface ;
- avancer ou reculer plus finement selon les contrôles disponibles ;
- retirer la vidéo chargée après confirmation.

Raccourcis courants indiqués par l'application :

| Raccourci | Action |
|---|---|
| `Espace` | Lecture / pause |
| `Flèche gauche` | Retour vidéo |
| `Flèche droite` | Avance vidéo |
| `,` | Recul image par image si disponible |
| `.` | Avance image par image si disponible |

## Comprendre la timeline
La timeline représente les moments importants de la vidéo. Elle est alimentée par les événements et labels créés à partir du panel.

Utilisation recommandée :
1. Charger la vidéo.
2. Préparer ou charger un panel.
3. Lancer la lecture.
4. Déclencher les événements au moment voulu.
5. Ajouter des labels lorsque l'action doit être qualifiée.
6. Relire les occurrences pour vérifier leur timing.
7. Sauvegarder la timeline.

Une timeline sauvegardée reste privée dans le comportement actuel documenté côté front : elle est visible par son propriétaire.

## Créer et utiliser un panel
Un panel regroupe les boutons qui accélèrent l'analyse.

Types de boutons :

| Type | Usage |
|---|---|
| Événement | Créer une occurrence dans la timeline |
| Label | Qualifier ou enrichir une occurrence |
| Statistique | Suivre un indicateur pendant l'analyse |

Créer un panel :
1. Ouvrir les actions du panel.
2. Créer un nouveau panel.
3. Ajouter les événements nécessaires.
4. Ajouter les labels utiles.
5. Ajouter les statistiques si elles sont pertinentes.
6. Nommer clairement les boutons.
7. Configurer les raccourcis ou propriétés disponibles.
8. Sauvegarder le panel.

## Organiser le layout
L'interface contient des mécanismes de drag and resize observés dans le code front. Quand le mode d'édition du layout est disponible :

1. Activer le mode d'édition.
2. Déplacer les blocs utiles.
3. Redimensionner les zones de travail.
4. Vérifier que la vidéo, la timeline et le panel restent lisibles.
5. Quitter le mode d'édition.

Bonnes pratiques :
- garder la vidéo suffisamment grande pour lire les actions ;
- placer le panel à un endroit accessible sans gêner la timeline ;
- éviter des zones trop petites qui ralentissent l'analyse.

## Sauvegarder une timeline
1. Vérifier que la timeline porte un nom compréhensible.
2. Ouvrir l'action de sauvegarde.
3. Ajouter une description si l'interface le propose.
4. Valider.
5. Attendre la confirmation.
6. Recharger la liste distante si nécessaire pour vérifier que la timeline est disponible.

En cas d'échec, vérifier la connexion, la session et l'état du service.

## Sauvegarder un panel
1. Vérifier le nom du panel.
2. Vérifier les boutons événements, labels et statistiques.
3. Choisir la visibilité si proposée.
4. Sauvegarder.
5. Attendre la confirmation.

Visibilités métier :

| Visibilité | Signification actuelle |
|---|---|
| Privé | Visible uniquement par son propriétaire |
| Public | Réutilisable par des utilisateurs connectés |
| Club | Prévu dans le modèle technique, à confirmer côté usage produit |

## Retrouver une ressource sauvegardée
1. Se connecter.
2. Ouvrir l'espace d'analyse.
3. Utiliser l'action de recherche ou de chargement distant.
4. Sélectionner une timeline ou un panel.
5. Confirmer le remplacement si l'application prévient que la ressource courante sera écrasée.

## Importer une timeline ou un panel
1. Préparer un fichier JSON exporté depuis Action Board.
2. Ouvrir le menu import/export.
3. Choisir l'import panel ou timeline.
4. Sélectionner le fichier.
5. L'application valide le format auprès du service `analysis-store`.
6. Si la validation réussit, charger la ressource.

Ne pas importer de fichier dont l'origine est inconnue.

## Exporter une timeline ou un panel
1. Ouvrir le menu import/export.
2. Choisir l'export souhaité.
3. Le navigateur télécharge un fichier JSON.
4. Conserver ce fichier dans un emplacement maîtrisé.

L'export est local côté navigateur. Il sert à archiver, transférer ou réimporter une structure d'analyse.

## Copier ou réutiliser un panel public
Quand un panel public est visible :
1. Ouvrir la recherche de panels.
2. Sélectionner le panel.
3. Le charger pour l'utiliser directement ou le copier si l'action est proposée.
4. Adapter le panel à sa méthode de travail.
5. Sauvegarder sa propre version si nécessaire.

## Anonymisation et données sensibles
Le modèle applicatif contient un indicateur de contenu anonymisé et certains boutons peuvent être marqués comme anonymisés. Cette fonctionnalité doit être utilisée avec prudence :

1. Éviter de saisir des noms complets si ce n'est pas nécessaire.
2. Utiliser des libellés génériques quand l'analyse doit être partagée.
3. Vérifier le panel et la timeline avant export ou publication.
4. Ne pas considérer l'anonymisation comme une garantie juridique complète sans validation humaine.

Lors de la suppression d'un compte, les ressources privées sont concernées par le workflow de suppression. Les panels publics peuvent être conservés sous forme anonymisée selon la logique applicative.

## Consulter l'état de l'application
Une page Uptime Kuma peut être exposée sur le domaine de statut configuré. Elle permet de voir si les services principaux sont disponibles.

À consulter si :
- la connexion échoue alors que les identifiants semblent corrects ;
- les sauvegardes échouent ;
- l'application semble lente ou indisponible.

## Erreurs fréquentes
| Situation | Cause probable | Action recommandée |
|---|---|---|
| Impossible de se connecter | Identifiants invalides ou session expirée | Réessayer, puis demander une réinitialisation si disponible |
| Retour à l'accueil pendant l'analyse | Access token expiré et refresh impossible | Se reconnecter |
| La vidéo ne se charge pas | Format non supporté ou fichier inaccessible | Tester un autre format ou navigateur |
| Sauvegarde impossible | Session expirée ou API indisponible | Se reconnecter, consulter le statut, réessayer |
| Import refusé | Fichier JSON invalide ou mauvais type | Réexporter depuis Action Board ou vérifier le fichier |
| Panel public introuvable | Ressource privée ou droits insuffisants | Vérifier la visibilité et le compte connecté |
| Données club non visibles | Domaine club non finalisé | Considérer la fonctionnalité comme à confirmer |

## Bonnes pratiques
- Préparer le panel avant de démarrer l'analyse.
- Nommer clairement les timelines et panels.
- Sauvegarder régulièrement.
- Exporter une copie JSON avant une grosse modification.
- Garder les panels publics génériques et anonymisés.
- Vérifier les données sensibles avant partage.
- Ne pas compter sur le stockage vidéo serveur : conserver la vidéo source de son côté.

## Limites connues
- Les vidéos sont chargées localement dans le navigateur.
- Les timelines publiques ne sont pas disponibles dans le comportement utilisateur actuel.
- Les fonctionnalités club, équipes, joueurs, tournois et matchs sont encore indisponibles côté interface.
- Le modèle club existe techniquement mais doit être confirmé fonctionnellement.
- Les écrans administrateur backend existent côté service auth, mais l'accès public n'est pas routé dans l'infra actuelle.

## Support
Avant de signaler un problème :
1. Vérifier la connexion.
2. Recharger l'application.
3. Consulter la page de statut si elle est disponible.
4. Noter l'action effectuée, l'heure approximative et le message d'erreur.
5. Transmettre ces informations au canal support du projet.
