# Tutoriel landing page

## Objectif du document
Décrire le tutoriel intégré à la landing page front pour accélérer l’onboarding et la compréhension produit.

## Principe
Le tutoriel est intégré directement dans la landing page via des composants dédiés, afin d’expliquer rapidement la valeur d’Analyse Basket à un nouvel utilisateur.

## Public cible
- Coachs
- Analystes vidéo
- Assistants coachs
- Étudiants STAPS
- Formateurs
- Clubs amateurs
- Utilisateurs découvrant l’application

## Objectifs pédagogiques
- Comprendre le besoin adressé.
- Comprendre le rôle de la timeline et du panel.
- Démarrer une analyse rapidement.
- Comprendre sauvegarde, anonymisation et statut des services.

## Positionnement dans l’application
- Landing page publique ou d’accueil.
- Complémentaire au manuel utilisateur.
- Point d’entrée avant accès complet aux fonctionnalités d’analyse.

## Structure recommandée du tutoriel
- Introduction courte
- Étapes “comment ça marche”
- Conseils pratiques
- Liens d’action (connexion, analyse, ressources)

## Sections à implémenter
1. Présentation du besoin
2. Charger ou utiliser une vidéo
3. Créer une timeline
4. Créer un panel
5. Ajouter events, labels, stats
6. Utiliser les raccourcis clavier
7. Sauvegarder
8. Exporter / Copier / Publier
9. Comprendre l’anonymisation
10. Consulter l’état de l’application

## Contenu détaillé des sections
### 1) Présentation du besoin
- Clubs à petit budget : besoin d’analyse vidéo accessible.
- Proposition : structurer l’analyse sans imposer une méthode unique.
- Positionnement low-cost et absence de stockage vidéo serveur par défaut.

### 2) Charger ou utiliser une vidéo
- L’analyse démarre à partir d’un support vidéo.
- Le stockage serveur n’est pas activé par défaut.
- La confidentialité des contenus reste un point d’attention utilisateur.

### 3) Créer une timeline
- La timeline est le fil d’analyse de la vidéo.
- Elle sert à repérer les moments importants.

### 4) Créer un panel
- Un panel est personnalisable.
- Chaque coach/analyste peut définir sa propre grille d’analyse.

### 5) Ajouter events, labels, stats
- Event : action ou moment important.
- Label : contexte de l’action.
- Stat : synthèse/indicateur global.

### 6) Utiliser les raccourcis clavier
- Les raccourcis accélèrent l’analyse.
- Raccourcis clés : `Espace`, `Flèche gauche`, `Flèche droite`.
- Navigation image par image : `virgule/point` selon configuration.
- Liste exhaustive des raccourcis : À compléter.

### 7) Sauvegarder
- Sauvegarder timeline et panel.
- Retrouver son analyse ultérieurement.

### 8) Exporter / Copier / Publier
- Fonctionnalités disponibles selon version.
- Distinction privé/public selon règles métier.
- Vérifier les données visibles avant partage.

### 9) Comprendre l’anonymisation
- Utile pour limiter l’exposition de données sensibles.
- Exemple : remplacer un nom par une valeur neutre avant diffusion.
- Vérifier le rendu final avant publication.

### 10) Consulter l’état de l’application
- La page de statut permet de vérifier la disponibilité des services.
- Utile en cas de comportement anormal ou d’indisponibilité.

## Composants front pressentis
Structure possible (noms exacts à confirmer) :
- Composant hero de présentation
- Section “Comment ça marche”
- Cartes étapes
- Mini FAQ
- Section raccourcis
- Section confidentialité/anonymisation
- Section état des services
- Call-to-action vers connexion/page d’analyse

Noms réels des composants front : À compléter.

## Déclencheurs d’affichage
Options possibles :
- affichage direct landing page ;
- bouton “Comment ça marche ?” ;
- aide contextuelle ;
- première connexion ;
- lien depuis le menu ;
- section FAQ.

Choix final de déclenchement : À compléter.

## Accessibilité du tutoriel
- Titres clairs.
- Textes courts.
- Boutons explicites.
- Contrastes suffisants.
- Navigation clavier.
- Information non dépendante uniquement de la couleur.
- Alternatives textuelles aux icônes.
- Responsive mobile/desktop.

## Mesure d’efficacité
| Indicateur | Mode de mesure | Statut |
|---|---|---|
| Compréhension du rôle d’une timeline | Feedback utilisateur / recette | À compléter |
| Compréhension du rôle d’un panel | Feedback utilisateur / recette | À compléter |
| Capacité à démarrer une analyse | Observation parcours | À compléter |
| Capacité à sauvegarder | Recette fonctionnelle | À compléter |
| Compréhension de l’anonymisation | Retours qualitatifs | À compléter |
| Satisfaction globale onboarding | Retours premiers utilisateurs | À compléter |

## Informations à compléter
- Noms exacts des composants front.
- Choix final des déclencheurs d’affichage.
- Méthode de collecte standardisée des retours onboarding.
