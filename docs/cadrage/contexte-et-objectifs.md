# Contexte et objectifs

## Objectif du document
Formaliser le contexte métier d’Analyse Basket, ses objectifs produit/techniques/exploitation, son périmètre et ses critères de réussite.

## Contexte métier
Analyse Basket répond à un besoin d’analyse vidéo sportive pour des structures à budget limité. Le produit vise une analyse exploitable d’un match en combinant vidéo, événements, labels, statistiques et sauvegarde d’analyse.

## Origine du projet
Le projet est né d’une expérience professionnelle et personnelle autour de clubs sportifs à moyens limités. Le constat terrain : il existe une demande réelle d’analyse vidéo avancée, sans solution low-cost suffisamment viable pour des usages approfondis.

## Problématique initiale
- Difficulté d’accéder à une solution abordable permettant une analyse complexe et structurée.
- Besoin de conserver des analyses métier sans imposer un stockage vidéo serveur coûteux.
- Besoin de rendre l’outil adaptable à plusieurs méthodes d’analyse et potentiellement à plusieurs sports.

## Proposition de valeur
- Solution low-cost d’analyse vidéo sportive.
- Structuration fine via timelines, panels personnalisés, labels et statistiques.
- Sauvegarde et récupération des analyses sur la plateforme.
- Pas de stockage vidéo par défaut pour réduire coûts, contraintes techniques et exposition de données sensibles.

## Cibles prioritaires
- Coach.
- Analyste vidéo.
- Clubs amateurs et structures à moyens limités.
- Assistant coach, étudiant STAPS, formateur (cibles secondaires à forte valeur d’adoption).

## Objectifs produit
- Permettre l’analyse d’un match via vidéo + structuration d’événements.
- Permettre la création et l’utilisation de timelines et de panels personnalisés.
- Permettre la sauvegarde, puis la récupération d’une analyse.
- Préparer des usages futurs : export, partage, contextualisation club/équipe/joueurs.

## Objectifs techniques
- Maintenir une architecture évolutive multi-services malgré une équipe unipersonnelle.
- Séparer identité/sessions et données métier.
- Limiter les ressources serveur en évitant le stockage vidéo par défaut.
- Préparer l’intégration future d’un service FFmpeg dédié.

## Objectifs d’exploitation
- Déploiement reproductible via conteneurs et images versionnées.
- Supervision de disponibilité des services.
- Processus de correction continue via tickets par dépôt.
- Documentation maintenable pour transmission et exploitation long terme.

## Objectifs sécurité et confidentialité
- Protéger les ressources privées (timelines/panels).
- Renforcer les contrôles d’accès et les rôles.
- Permettre l’anonymisation des éléments sensibles.
- Limiter le stockage inutile de données sensibles.

## Objectifs UX
- Proposer une expérience d’analyse fluide côté front.
- Offrir une prise en main progressive, notamment via tutoriel intégré.
- Permettre des méthodes d’analyse personnalisables selon les profils et disciplines.

## Périmètre actuel
- Authentification et gestion de session.
- Page d’analyse vidéo.
- Création/usage de panels.
- Création/usage de timelines.
- Sauvegarde et récupération d’analyses.

## Hors périmètre actuel
- Extraction vidéo automatisée (service FFmpeg dédié à venir).
- Association avancée analyse-club-équipe-joueurs.
- Stockage vidéo temporaire en production (à étudier RGPD).

## Critères de succès
Le projet est considéré comme réussi si un utilisateur peut :
1. réaliser l’analyse d’un match ;
2. sauvegarder cette analyse ;
3. récupérer le résultat d’analyse sur le site.

## Informations à compléter
- Indicateurs chiffrés d’adoption (nombre d’utilisateurs actifs, fréquence d’analyse).
- Priorisation détaillée des évolutions post-MVP.
