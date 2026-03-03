# ADR 0001 - Repo infra as source of truth

- Statut: Accepted
- Date: 2026-03-03

## Contexte
Le projet démarre avec plusieurs services (`front-service`, `auth-service`) qui doivent rester alignés sur:
- conventions de routage,
- responsabilités inter-repos,
- orchestration locale et tests d’intégration.

Sans référentiel central, la dérive de configuration est probable (routes différentes, ports incohérents, comportements dev divergents).

## Décision
Créer et maintenir le repo `infra` comme **source de vérité** pour:
- la documentation d’architecture transversale,
- la configuration Docker Compose de référence,
- les conventions de routing/sécurité,
- le guide d’onboarding de nouveaux services.

## Raisons
1. Réduire la divergence de configuration entre équipes.
2. Simplifier l’onboarding et le debug local.
3. Imposer Traefik comme point d’entrée unique dès le MVP.
4. Préparer des évolutions transverses (JWT gateway, observabilité).

## Conséquences
### Positives
- Contrats inter-services explicites.
- Tests “via Traefik” reproductibles.
- Gouvernance claire sur les conventions infra.

### Trade-offs
- Nécessite une discipline de mise à jour documentaire.
- Les repos applicatifs doivent référencer `infra` pour le run local intégré.

## Non-objectifs
- Héberger la logique métier.
- Remplacer les README techniques propres à chaque service.
