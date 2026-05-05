# Besoins et exigences

## Objectif du document
Structurer les besoins métier et les exigences de réalisation pour le MVP et les évolutions d’Analyse Basket.

## Besoins fonctionnels
- Authentifier les utilisateurs et gérer leurs sessions.
- Permettre l’analyse vidéo avec événements, labels et statistiques.
- Créer/utiliser des timelines et panels personnalisés.
- Sauvegarder et récupérer une analyse.
- Permettre export, copie et publication de panels selon règles métier.
- Permettre l’anonymisation de contenus sensibles.

## Besoins non fonctionnels
- Positionnement low-cost et maîtrise des ressources.
- Disponibilité des services et supervision.
- Maintenabilité multi-repos.
- Évolutivité vers de nouveaux services (ex: FFmpeg).

## Exigences techniques
- Architecture multi-services (front/auth/analysis-store/infra).
- Persistance backend des analyses.
- Absence de stockage vidéo par défaut.
- CI/CD avec images versionnées.

## Exigences sécurité et confidentialité
- Protection des ressources privées.
- Contrôle d’accès par rôles et ownership.
- Anonymisation des contenus sensibles.
- Limitation du stockage de données sensibles.

## Exigences exploitation
- Déploiement reproductible.
- Monitoring de disponibilité.
- Gestion d’anomalies via tickets par dépôt.

## Exigences UX et accessibilité
- Expérience d’analyse fluide.
- Tutoriel intégré à la landing page.
- Accessibilité progressive et documentée.

## Exigences documentation
- Documentation maintenable, centralisée et exploitable.
- Traçabilité des choix, risques et procédures.

## Tableau des exigences
| ID | Exigence | Type | Priorité | Justification | Statut | Preuve ou document associé |
|---|---|---|---|---|---|---|
| EXG-01 | Authentification | Fonctionnelle | Haute | Contrôle d’accès de base | En place | `docs/architecture/flux-authentification.md` |
| EXG-02 | Gestion de session | Fonctionnelle | Haute | Continuité d’usage sécurisée | En place | `docs/architecture/flux-authentification.md` |
| EXG-03 | Analyse vidéo | Fonctionnelle | Haute | Cœur métier | En place | `docs/cadrage/contexte-et-objectifs.md` |
| EXG-04 | Création timeline | Fonctionnelle | Haute | Structuration des événements | En place | `docs/architecture/flux-analysis-store.md` |
| EXG-05 | Création panel | Fonctionnelle | Haute | Personnalisation méthode d’analyse | En place | `docs/architecture/flux-analysis-store.md` |
| EXG-06 | Gestion événements | Fonctionnelle | Haute | Granularité d’analyse | En place | À compléter |
| EXG-07 | Gestion labels | Fonctionnelle | Haute | Contextualisation des événements | En place | À compléter |
| EXG-08 | Statistiques | Fonctionnelle | Haute | Synthèse et tendances | En place | À compléter |
| EXG-09 | Sauvegarde d’analyse | Fonctionnelle | Haute | Durabilité du travail utilisateur | En place | `docs/architecture/flux-analysis-store.md` |
| EXG-10 | Récupération d’analyse | Fonctionnelle | Haute | Critère de réussite métier | En place | `docs/cadrage/contexte-et-objectifs.md` |
| EXG-11 | Export / copie | Fonctionnelle | Moyenne | Réutilisation et diffusion | Partiel | `docs/architecture/flux-analysis-store.md` |
| EXG-12 | Publication de panels | Fonctionnelle | Moyenne | Partage de méthodes d’analyse | Partiel | À compléter |
| EXG-13 | Anonymisation | Sécurité | Haute | Protection identité numérique | En place | À compléter |
| EXG-14 | Absence stockage vidéo par défaut | Technique/Coût | Haute | Low-cost + confidentialité | En place | `docs/cadrage/etude-comparative.md` |
| EXG-15 | Extraction vidéo via FFmpeg | Évolution | Basse | Besoin futur métier | Prévu | À compléter |
| EXG-16 | Contextualisation club/équipe/joueur | Évolution | Basse | Enrichissement métier | Prévu | À compléter |
| EXG-17 | Tutoriel landing page | UX | Moyenne | Onboarding utilisateur | Prévu | `docs/utilisateur/tutoriel-landing-page.md` |
| EXG-18 | Supervision disponibilité | Exploitation | Haute | Réduction MTTR | En place | `docs/exploitation/monitoring-supervision.md` |
| EXG-19 | CI/CD multi-repos | Exploitation | Haute | Reproductibilité des déploiements | En place | À compléter |
| EXG-20 | Documentation maintenable | Gouvernance | Haute | Transmission et exploitation | En place | `docs/README.md` |
