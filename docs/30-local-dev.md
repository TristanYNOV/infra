# 30 - Local development

## Prérequis
- Docker Engine + Docker Compose plugin.
- Accès en lecture aux images GHCR privées `front-service` et `auth-service`.
- (Optionnel) accès GHCR pour `analysis-store-service` si vous activez le profil `analysis-store`.

## 1) Configuration
```bash
cp .env.example .env
```

Renseigner ensuite :
- `FRONT_IMAGE`, `AUTH_IMAGE` (digest recommandé `@sha256:...`, sinon `:prod`),
- placeholders `ANALYSIS_STORE_IMAGE`, `ANALYSIS_STORE_IMAGE_TAG` si vous activez `analysis-store`,
- variables sensibles `AUTH_JWT_SECRET`, `AUTH_ADMIN_*`,
- variables auth runtime (`AUTH_DB_NAME`, `AUTH_JWT_EXPIRES_IN`, etc.).

## 2) Login GHCR
```bash
docker login ghcr.io
```

## 3) Lancer la stack
```bash
make pull
make up
make ps
```

## 4) Vérifier le routage
```bash
curl -i http://localhost/
curl -i http://localhost/health
curl -i http://localhost/me
curl -i http://localhost/users
# optionnel (profil analysis-store actif)
curl -i http://localhost/analysis-store/api/health
```

## URLs utiles
- Front via Traefik : `http://localhost/`
- Dashboard Traefik : `http://127.0.0.1:8080/dashboard/`

## Commandes utiles
```bash
make logs
make restart
make health
make down
make config
```

## Mise à jour d’image (pinning propre)
1. Prendre le digest publié par le workflow applicatif.
2. Remplacer `FRONT_IMAGE`, `AUTH_IMAGE` et/ou `ANALYSIS_STORE_IMAGE` + `ANALYSIS_STORE_IMAGE_TAG` dans `.env`.
3. Relancer :
   ```bash
   make pull
   make up
   ```

## Notes
- Mongo reste interne Docker (`mongo:27017`).
- `DATABASE_URL` côté auth doit viser le service Docker Mongo (par défaut `mongodb://mongo:27017`).
- Le repo `infra` n’effectue aucun build applicatif local.


## Profil optionnel analysis-store
```bash
docker compose --profile analysis-store pull
docker compose --profile analysis-store up -d
```

Pré-requis dans `.env` :
- `ANALYSIS_STORE_IMAGE` (owner GHCR réel),
- `ANALYSIS_STORE_IMAGE_TAG` (tag SemVer/sha réel),
- `ANALYSIS_STORE_MASTER_KEY`,
- `ANALYSIS_STORE_DB_PASSWORD`.
