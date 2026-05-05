# Flux analysis-store

## Objectif du document
Documenter les opérations de sauvegarde et diffusion d’analyse.

## Séquence simplifiée
```mermaid
sequenceDiagram
participant U as Utilisateur
participant F as Front
participant S as Analysis Store
U->>F: Édition timeline/panel
F->>S: POST /api/timelines
S-->>F: Timeline sauvegardée
F->>S: POST /api/panels
S-->>F: Panel sauvegardé
F->>S: POST publication/export/copy/anonymisation
S-->>F: Statut opération
```

## Points de vigilance
- Ownership des ressources.
- Traçabilité publication/anonymisation.
