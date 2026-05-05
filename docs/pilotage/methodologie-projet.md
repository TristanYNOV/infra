# Méthodologie projet

## Objectif du document
Décrire la méthode de pilotage retenue pour Analyse Basket et ses règles d’application dans un contexte projet mené majoritairement par une seule personne.

## Contexte de pilotage
Le projet est personnel, professionnel et académique, avec un objectif MVP en environ un an, en parallèle d’obligations professionnelles et personnelles.

## Méthodologie retenue
Approche agile pragmatique, proche d’un Kanban allégé :
- itérations par lots fonctionnels et techniques ;
- priorisation continue ;
- adaptation en fonction des risques et apprentissages ;
- validation progressive des fonctionnalités critiques.

## Justification de la méthodologie
- Projet réalisé seul.
- Besoin de flexibilité élevé.
- Incertitudes techniques fortes au démarrage.
- Multi-repos à synchroniser (front, auth, analysis-store, infra).
- Nécessité de livrer progressivement un MVP utile.

## Organisation du travail
- Découpage par lots (auth, analyse, stockage, infra, monitoring, documentation).
- Suivi des tâches via GitHub Issues par repo.
- Développement incrémental avec validations intermédiaires.

## Gestion du backlog
- Backlog distribué par repo.
- Tickets souvent préfixés (`[bug]`, `[feature]`, `[infra]`, `[doc]`, `[security]`).
- Revue régulière et repriorisation selon avancement et risques.

## Gestion des priorités
Priorisation par :
- valeur utilisateur ;
- criticité technique ;
- sécurité ;
- stabilité ;
- contrainte de temps ;
- cohérence avec le MVP.

## Validation des livrables
- Validation actuelle majoritairement par le porteur du projet.
- Validation fonctionnelle manuelle des parcours critiques.
- Extension prévue via clubs témoins et utilisateurs métier.

## Limites de la méthode
- Forte dépendance à la disponibilité d’une seule personne.
- Risque de dispersion sur sujets transverses.
- Pilotage encore peu outillé (pas de dashboard consolidé complet).

## Améliorations prévues
- Structurer un tableau de bord consolidé (ex : GitHub Projects).
- Formaliser davantage critères d’entrée/sortie des lots.
- Renforcer le cycle de validation métier externe.

## Tableau de synthèse
| Principe méthodologique | Application dans Analyse Basket | Bénéfice | Limite | Amélioration prévue |
|---|---|---|---|---|
| Kanban allégé | Tickets par repo + priorisation continue | Simplicité et réactivité | Vision globale partiellement manuelle | Dashboard consolidé |
| Itérations par lots | Livraisons incrémentales front/auth/store/infra | Réduction du risque global | Coordination multi-repos exigeante | Jalons mieux formalisés |
| Priorisation par valeur/risque | Arbitrages orientés MVP | Focus sur impact utilisateur | Replanification fréquente | Règles de priorisation documentées |
| Validation manuelle critique | Recette et tests ciblés | Contrôle pragmatique qualité | Peu automatisé à grande échelle | Renforcer e2e et critères de validation |
