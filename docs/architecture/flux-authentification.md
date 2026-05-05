# Flux authentification

## Objectif du document
Décrire le cycle login/access token/refresh/logout.

## Séquence simplifiée
```mermaid
sequenceDiagram
participant U as Utilisateur
participant F as Front
participant A as Auth Service
U->>F: Saisie identifiants
F->>A: POST /auth/login
A-->>F: access token + refresh token
F-->>U: Session active
F->>A: POST /auth/refresh
A-->>F: Nouveau access token
F->>A: POST /auth/logout
A-->>F: Session invalidée
```

## Contrôles
- Rôles utilisateur/admin.
- Expiration des tokens.
- Gestion des sessions: À compléter.
