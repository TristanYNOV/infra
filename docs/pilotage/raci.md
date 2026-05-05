# RACI

## Objectif du document
Clarifier les responsabilités de pilotage et d’exécution dans un contexte projet majoritairement porté par une seule personne.

## Rappel de la méthode RACI
- **R (Responsible)** : réalise l’activité.
- **A (Accountable)** : décideur et garant final.
- **C (Consulted)** : consulté avant décision.
- **I (Informed)** : informé du résultat.

## Adaptation au contexte solo
Plusieurs rôles sont actuellement assumés par le porteur du projet (développeur front/backend, référent infra, exploitant, administrateur). La matrice reste utile pour distinguer responsabilités actuelles et futures interactions externes.

## Acteurs / rôles
- Porteur du projet
- Utilisateur métier / coach
- Club témoin futur
- Administrateur applicatif
- Exploitant technique
- Développeur front
- Développeur backend
- Référent infrastructure
- Support utilisateur futur

## Matrice RACI
| Activité | Responsable | Accountable / Décideur | Consulté | Informé | Commentaire |
|---|---|---|---|---|---|
| Cadrage besoin | Porteur du projet | Porteur du projet | Utilisateur métier / coach | Club témoin futur | Pilotage centralisé |
| Conception UX | Développeur front (porteur) | Porteur du projet | Utilisateur métier / coach | Parties prenantes | Validation terrain à renforcer |
| Développement front | Développeur front (porteur) | Porteur du projet | Développeur backend (porteur) | Utilisateur métier | Rôle cumulé |
| Développement auth-service | Développeur backend (porteur) | Porteur du projet | Administrateur applicatif (porteur) | Exploitant technique (porteur) | Rôle cumulé |
| Développement analysis-store | Développeur backend (porteur) | Porteur du projet | Utilisateur métier / coach | Support futur | Rôle cumulé |
| Infrastructure | Référent infrastructure (porteur) | Porteur du projet | Exploitant technique (porteur) | Parties prenantes | Rôle cumulé |
| CI/CD | Développeur backend/front (porteur) | Porteur du projet | Référent infrastructure (porteur) | Parties prenantes | Harmonisation continue |
| Monitoring | Exploitant technique (porteur) | Porteur du projet | Référent infrastructure (porteur) | Utilisateurs cibles | Uptime en place, Prom/Graf prévu |
| Recette | Porteur du projet | Porteur du projet | Utilisateur métier / coach | Club témoin futur | Validation aujourd’hui interne |
| Validation métier | Porteur du projet | Porteur du projet | Utilisateur métier / coach | Club témoin futur | Externe à renforcer |
| Documentation | Porteur du projet | Porteur du projet | Parties prenantes consultées | Tous rôles | Base de transmission |
| Maintenance | Exploitant technique (porteur) | Porteur du projet | Référent infrastructure (porteur) | Utilisateurs | Rôle cumulé |
| Support | Support utilisateur futur (porteur actuellement) | Porteur du projet | Utilisateur métier | Parties prenantes | Processus support à formaliser |
| Arbitrages | Porteur du projet | Porteur du projet | Utilisateurs métier, collègues | Parties prenantes | Journal d’arbitrages maintenu |

## Limites
- Cumul de rôles pouvant ralentir certaines décisions.
- Validation métier externe encore limitée.

## Évolutions possibles
- Formaliser une boucle de validation avec clubs témoins.
- Distinguer progressivement rôles exploitation/support si montée en charge.
