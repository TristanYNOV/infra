# Uptime Kuma

## Rôle

Uptime Kuma permet de superviser simplement la disponibilité (uptime) des services principaux de la stack Docker Compose.

## Démarrage

Depuis la racine du repo `infra` :

```bash
docker compose up -d uptime-kuma
```

Ou pour démarrer toute la stack :

```bash
docker compose up -d
```

## Port utilisé (3002 -> 3001)

`analysis-store-service` utilise déjà le port interne `3001`.

Uptime Kuma écoute aussi sur le port `3001` **dans son conteneur**, donc on mappe Uptime Kuma sur le port hôte `3002` :

- Host: `3002`
- Container: `3001`

Cela évite tout conflit et permet un accès local via :

- http://localhost:3002

## Accès à l'interface

Une fois le service lancé, ouvrir :

- http://localhost:3002

## Réseau Docker et URLs des monitors

Uptime Kuma est attaché au même réseau Docker (`infra-backend`) que les services applicatifs.

Pour cette raison, les checks HTTP doivent cibler les **noms de services Docker** (DNS interne Docker), et non `localhost`.

- `localhost` depuis le conteneur Uptime Kuma pointe sur le conteneur Uptime Kuma lui-même.
- Les noms de services (`front-service`, `auth-service`, `analysis-store-service`) pointent vers les bons conteneurs sur le réseau partagé.

## Monitors à créer

### 1) Front service

- Type: HTTP(s)
- Name: `front-service`
- URL: `http://front-service:4000/healthz`
- Expected status: `200`

### 2) Auth service

- Type: HTTP(s)
- Name: `auth-service`
- URL: `http://auth-service:3000/health`
- Expected status: `200`

### 3) Analysis Store service

- Type: HTTP(s)
- Name: `analysis-store-service`
- URL: `http://analysis-store-service:3001/api/health`
- Expected status: `200`

## Vérifier que les checks sont UP

1. Aller sur http://localhost:3002
2. Créer les 3 monitors ci-dessus.
3. Vérifier dans le dashboard Uptime Kuma que chaque monitor passe en statut **UP**.
4. En cas d'échec, vérifier que les services sont démarrés (`docker compose ps`) et en bonne santé.

## Suppression des données Uptime Kuma

Les données Uptime Kuma sont persistées dans le volume Docker `uptime-kuma-data`.

Pour supprimer les données :

```bash
docker compose down
docker volume rm infra_uptime-kuma-data
```

> Selon le nom de projet Compose, le préfixe peut varier. Vérifier avec `docker volume ls | grep uptime-kuma-data`.
