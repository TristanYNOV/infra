# 35 - Déploiement DEV/staging avec Watchtower (Option 1)

## Pourquoi Watchtower
En DEV/staging, Watchtower évite les redémarrages manuels :
- il vérifie périodiquement les nouvelles versions d’images,
- il fait le pull,
- il redémarre les conteneurs ciblés.

## Comment ça marche ici
- Service `watchtower` activable via profil Compose `watchtower`.
- Surveillance **label-based** (`com.centurylinklabs.watchtower.enable=true`).
- Cibles : `front-service` et `auth-service`.
- Poll interval configurable via `WATCHTOWER_POLL_INTERVAL`.

## Activation
```bash
make up-watchtower
make logs-watchtower
```

## Désactivation
```bash
make down
make up
```

## Conventions de tags
- DEV/staging : tags mouvants possibles (`dev`, `staging`, voire `latest` si assumé).
- Production : préférer des tags immuables/versionnés (pas de `latest`).

## Observer une mise à jour
1. Publier une nouvelle image avec le tag surveillé.
2. Attendre l’intervalle de polling.
3. Vérifier les logs :
   ```bash
   make logs-watchtower
   ```
4. Confirmer le redémarrage de `front-service` / `auth-service`.

## Checklist sécurité
- [ ] Watchtower limité aux environnements DEV/staging.
- [ ] Socket Docker monté en lecture seule.
- [ ] Mode label-enable activé pour limiter le scope.
- [ ] Seuls les services nécessaires sont marqués `watchtower.enable=true`.
