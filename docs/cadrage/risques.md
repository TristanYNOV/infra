# Registre des risques

## Objectif du document
Suivre les risques projet, leur criticité et les mesures de prévention/correction associées.

## Méthode d’évaluation
- Probabilité : Faible / Moyenne / Forte.
- Impact : Faible / Moyen / Fort.
- Criticité : Faible / Modérée / Élevée / Critique.

## Registre des risques
| ID | Risque | Catégorie | Probabilité | Impact | Criticité | Conséquence | Mesure de prévention | Mesure de correction | Indicateur de suivi | Statut |
|---|---|---|---|---|---|---|---|---|---|---|
| RSK-01 | Perte de données | Données | Moyenne | Fort | Critique | Perte d’analyses | Politique de sauvegarde à définir | Procédure restauration | Existence backup testé | Ouvert |
| RSK-02 | Absence de backup | Exploitation | Forte | Fort | Critique | Indisponibilité durable des données | Plan backup avant mise en ligne élargie | Backup manuel d’urgence | Taux de sauvegardes réussies | Ouvert |
| RSK-03 | Accès non autorisé timeline/panel privé | Sécurité | Moyenne | Fort | Élevée | Fuite de données métier | Rôles + ownership + guards | Correctif d’autorisation + audit | Nombre d’incidents d’accès | En cours |
| RSK-04 | Anonymisation incomplète ou mal comprise | Confidentialité | Faible | Moyen | Modérée | Exposition d’identité numérique | Tests métier + consignes UX | Correctifs ciblés d’anonymisation | Retours utilisateurs/anomalies | Surveillé |
| RSK-05 | Indisponibilité backend | Exploitation | Moyenne | Fort | Élevée | Interruption de service | Healthchecks + monitoring | Redéploiement/rollback | Uptime par service | En cours |
| RSK-06 | Incohérence front/API | Technique | Moyenne | Moyen | Modérée | Erreurs de parcours utilisateur | Contrats API, revue inter-repos | Patch coordonné multi-repos | Nombre d’erreurs d’intégration | En cours |
| RSK-07 | Mauvaise configuration Traefik | Infrastructure | Moyenne | Fort | Élevée | Routage erroné, exposition non voulue | Revue config/priorités routes | Correctif labels/routes | Incidents de routage | En cours |
| RSK-08 | Secrets exposés | Sécurité | Faible | Fort | Élevée | Compromission potentielle | Gestion stricte `.env` et accès | Rotation secrets | Alertes fuite secrets | Surveillé |
| RSK-09 | Dépendance vulnérable | Sécurité | Moyenne | Moyen | Modérée | Surface d’attaque accrue | Veille + mises à jour régulières | Patch version + tests | Résultats audit dépendances | En cours |
| RSK-10 | Régression au déploiement | Exploitation | Moyenne | Fort | Élevée | Rupture de service | CI/CD + checklists | Rollback + correction rapide | Taux d’échec déploiement | En cours |
| RSK-11 | Monitoring insuffisant | Exploitation | Moyenne | Moyen | Modérée | Détection tardive incidents | Uptime Kuma + plan Prom/Graf | Ajout sondes/alertes | Couverture de supervision | En cours |
| RSK-12 | Difficulté de prise en main | Produit/UX | Moyenne | Moyen | Modérée | Adoption faible | Tutoriel intégré + docs | Ajustements UX | Taux de complétion parcours | À suivre |
| RSK-13 | Complexité multi-repos | Organisation | Forte | Moyen | Élevée | Coordination plus lente | Processus ticketing par repo | Arbitrage/priorisation | Délai moyen de résolution | En cours |
| RSK-14 | Suppression utilisateur incomplète interservices | Données/Sécurité | Moyenne | Fort | Élevée | Données résiduelles | Concevoir flux interservices | Purge corrective | Taux de suppression complète | Prévu |
| RSK-15 | Stockage vidéo futur non conforme RGPD | Conformité | Moyenne | Fort | Élevée | Risque réglementaire | Cadrage juridique/technique | Suspension fonction + correctifs | Revue conformité | Prévu |
| RSK-16 | Service FFmpeg futur coûteux/complexe | Technique/Coût | Moyenne | Moyen | Modérée | Surcharge infra | Étude d’architecture dédiée | Limiter périmètre et QoS | Coût par extraction | Prévu |
| RSK-17 | Coûts d’hébergement non maîtrisés | Financier | Moyenne | Fort | Élevée | Dépassement budget low-cost | Pilotage capacité/ressources | Réduction scope infra | Coût mensuel réel | En cours |

## Risques prioritaires
- **Perte de données / absence de backup** : priorité critique avant montée en production étendue.
- **Accès non autorisé** : renforcer en continu ownership, rôles et protections des routes.
- **Complexité infrastructure** : consolider pratiques de déploiement et supervision.
- **Coûts liés à la vidéo** : maintenir non-stockage par défaut, encadrer fortement toute évolution de stockage.
- **Conformité et confidentialité** : surveiller les flux liés à l’identité numérique et l’anonymisation.

## Gestion des anomalies et améliorations
Le suivi repose sur la création de tickets par dépôt, traités selon gravité et impact, afin de prioriser corrections et améliorations de manière continue.
