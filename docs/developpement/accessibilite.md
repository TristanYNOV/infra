# Accessibilité

## Objectif du document
Décrire l’approche accessibilité du projet Analyse Basket dans le périmètre développement produit.

## Référentiel et approche
- Référence principale : principes RGAA et bonnes pratiques web d’accessibilité.
- Approche : amélioration progressive, priorisation des parcours critiques et contrôles réguliers.

## Contexte métier
Analyse Basket repose sur une activité métier fortement visuelle : l’analyse vidéo sportive. Certaines fonctionnalités centrales ne peuvent pas être rendues totalement équivalentes pour une personne non-voyante sans modifier la nature du service. En revanche, toutes les zones qui peuvent être rendues accessibles doivent l’être : navigation, authentification, formulaires, boutons, tutoriel, documentation, messages d’erreur, focus clavier et contrastes.

## Mesures prises
- Navigation clavier sur les parcours standards : à renforcer et valider.
- Labels explicites sur formulaires d’authentification et de saisie : à vérifier.
- Boutons icônes avec `aria-label` lorsque nécessaire : à vérifier.
- Focus visible sur éléments interactifs : à vérifier.
- Contrastes lisibles : à vérifier.
- Messages d’erreur compréhensibles : à vérifier.
- Tutoriel intégré à la landing page (onboarding) : prévu/en cours.
- Documentation des raccourcis clavier : à compléter.
- Ne pas reposer l’information uniquement sur la couleur : principe à appliquer systématiquement.

## Limites métier
- Certaines interactions avancées d’analyse vidéo et de manipulation temporelle peuvent rester difficiles sans adaptation spécifique.
- Les usages de drag and drop nécessitent des alternatives clavier quand cela est possible.

## Tableau de suivi accessibilité
| Critère | Mesure actuelle | Statut | Limite | Amélioration prévue |
|---|---|---|---|---|
| Navigation clavier | Partiellement adressée | À compléter | Couverture incomplète | Campagne de tests clavier systématique |
| Labels formulaires | Présents sur parcours clés (à vérifier) | À compléter | Non audité globalement | Audit formulaire par formulaire |
| `aria-label` icônes | Utilisation ponctuelle (à vérifier) | À compléter | Risque d’omission | Règle de revue UI dédiée |
| Focus visible | Présent partiellement (à vérifier) | À compléter | Incohérences possibles | Standardiser styles focus |
| Contrastes | Non mesurés globalement | À compléter | Non conformité potentielle | Contrôle outillé des contrastes |
| Messages d’erreur | Présents fonctionnellement | À compléter | Qualité rédactionnelle variable | Normaliser wording et aide utilisateur |
| Tutoriel landing page | Ciblé comme support onboarding | En cours | Périmètre final à stabiliser | Finaliser contenu et tests |
| Raccourcis clavier | Non documentés complètement | À compléter | Adoption réduite | Documenter et exposer dans UI |
| Couleur comme seul signal | Vigilance en cours | À compléter | Risque d’ambiguïté | Ajouter icônes/texte complémentaire |
| Drag and drop | Présent sur certains flux (à confirmer) | À compléter | Accessibilité limitée | Prévoir alternatives clavier |

## Checklist opérationnelle
- Navigation clavier bout en bout.
- Focus visible sur composants interactifs.
- Labels et aides contextuelles sur formulaires.
- Vérification des contrastes critiques.
- Erreurs compréhensibles et actionnables.
- Équivalents textuels des éléments non textuels essentiels.

## Améliorations prévues
- Audit accessibilité régulier sur parcours prioritaires.
- Formaliser des critères d’acceptation accessibilité dans la recette.
- Compléter la documentation utilisateur orientée accessibilité.

## À compléter
- Résultats d’audit RGAA sur version courante.
- Liste exhaustive des composants validés/non validés.
