# Flux d’authentification

## Objectif du document
Documenter le cycle d’authentification et de session (inscription, login, refresh, logout, rôles) d’Analyse Basket.

## Principes
- L’access token est utilisé par le front pour les appels authentifiés.
- Le refresh token est opaque et stocké côté navigateur dans un cookie HttpOnly.
- La session est gérée côté auth-service.

## Flux principal (texte)
```txt
1. L’utilisateur saisit ses identifiants dans le front.
2. Le front appelle POST /auth/login.
3. L’auth-service vérifie les identifiants.
4. L’auth-service renvoie un access token au front.
5. L’auth-service positionne un refresh token opaque dans un cookie HttpOnly.
6. Le front utilise l’access token pour les appels protégés.
7. Lorsque l’access token expire, le front appelle POST /auth/refresh.
8. L’auth-service vérifie le refresh token via le cookie.
9. Un nouvel access token est émis.
10. Au logout, la session est invalidée côté auth-service.
```

## Sous-flux fonctionnels
### Inscription
- Création de compte via endpoint d’inscription (`/auth/...`) : À compléter.
- Initialisation des rôles par défaut (utilisateur standard attendu).

### Login
- Validation identifiants.
- Émission access token + cookie refresh token HttpOnly.

### Appel `/me`
- Le front appelle `/me` avec access token.
- auth-service renvoie l’identité et le rôle courant.

### Refresh
- Appel `POST /auth/refresh`.
- Vérification du refresh token opaque présent en cookie HttpOnly.
- Émission d’un nouvel access token.

### Logout
- Appel `POST /auth/logout`.
- Invalidation de session et révocation du refresh token côté service.

### Sessions et rôles
- Multi-sessions : À compléter (comportement exact attendu).
- Rôles `user` / `admin` appliqués via guards et règles d’accès.

## Endpoints principaux
| Endpoint | Méthode | Rôle |
|---|---|---|
| `/auth/login` | POST | Authentifier l’utilisateur |
| `/auth/refresh` | POST | Renouveler l’access token |
| `/auth/logout` | POST | Terminer la session |
| `/me` | GET | Retourner le profil connecté |
| `/users/...` | Variable | Gestion utilisateur (selon droits) |
| `/admin/...` | Variable | Actions administrateur |
| `/health` | GET | Vérification disponibilité auth-service |

## Risques et contrôles
| Risque | Contrôle en place | Point de validation |
|---|---|---|
| Vol de token | Refresh en cookie HttpOnly, séparation access/refresh | Vérifier flags cookie en prod |
| Expiration access token | Endpoint refresh dédié | Vérifier UX de renouvellement silencieux |
| Logout incomplet | Invalidation session côté serveur | Tester revocation effective |
| Accès admin indu | Guards/rôles | Tester endpoints admin avec user standard |
| Multi-sessions | Politique de session | À compléter |
| Cookie en production | Flag `Secure` attendu en HTTPS | À compléter |
| SameSite inadapté | Configuration `SameSite` | À compléter |

## Points à vérifier dans le projet
- Rate limiting sur login : À compléter.
- Politique mot de passe : À compléter.
- Logs d’échec de connexion : À compléter.
- Comportement exact en cas d’expiration simultanée access+refresh : À compléter.
