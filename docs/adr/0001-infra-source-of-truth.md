# ADR 0001 - infra comme source de vérité

- Statut : Accepted
- Date : 2026-03-03

## Contexte
Le projet repose sur plusieurs repos applicatifs. Sans référentiel commun, les conventions d’orchestration, de routing et de sécurité divergent rapidement.

## Décision
Le repo `infra` devient la source de vérité pour :
- Docker Compose local (stack de référence),
- conventions de routage Traefik,
- règles de sécurité locale,
- documentation transversale et onboarding.

## Conséquences
### Positives
- Alignement inter-équipes.
- Setup local reproductible.
- Évolution contrôlée de l’architecture.

### Trade-offs
- Discipline documentaire nécessaire.
- Coordination obligatoire lors de tout changement transverse.
