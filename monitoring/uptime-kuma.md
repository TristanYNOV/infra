# Uptime Kuma

## Rôle
Uptime Kuma supervise simplement la disponibilité des services principaux de la stack Docker Compose. Il complète Prometheus/Grafana : Uptime Kuma répond à la question "le service est-il disponible ?", tandis que Prometheus/Grafana servent au diagnostic par métriques.

## Démarrage
Depuis la racine du repo `infra` :

```bash
docker compose up -d uptime-kuma
```

Ou pour démarrer toute la stack :

```bash
docker compose up -d
```

## Exposition actuelle
Dans le `docker-compose.yml` actuel, Uptime Kuma n'est pas publié directement sur un port hôte. Il est exposé via Traefik avec le domaine :

```env
UPTIME_KUMA_DOMAIN=status.example.com
```

Le conteneur Uptime Kuma écoute sur le port interne `3001`, et Traefik route vers ce port.

Routes Traefik :

| Route | Entrypoint | TLS |
|---|---|---|
| `Host(UPTIME_KUMA_DOMAIN)` | `web` | Non |
| `Host(UPTIME_KUMA_DOMAIN)` | `websecure` | Oui, Let's Encrypt |

## Accès à l'interface
Une fois le DNS configuré et la stack lancée :

```text
https://status.example.com
```

Remplacer `status.example.com` par la valeur réelle de `UPTIME_KUMA_DOMAIN`.

## Réseau Docker et URLs des monitors
Uptime Kuma est attaché au réseau Docker `infra-backend`, comme les services applicatifs. Les checks HTTP doivent donc cibler les noms de services Docker, pas `localhost`.

`localhost` depuis le conteneur Uptime Kuma pointe sur Uptime Kuma lui-même.

## Monitors à créer
### Front service
- Type : HTTP(s)
- Name : `front-service`
- URL : `http://front-service:4000/healthz`
- Expected status : `200`

### Auth service
- Type : HTTP(s)
- Name : `auth-service`
- URL : `http://auth-service:3000/health`
- Expected status : `200`

### Analysis Store service
- Type : HTTP(s)
- Name : `analysis-store-service`
- URL : `http://analysis-store-service:3001/api/health`
- Expected status : `200`

## Vérifier que les checks sont UP
1. Ouvrir le domaine Uptime Kuma configuré.
2. Créer les monitors ci-dessus.
3. Vérifier que chaque monitor passe en statut `UP`.
4. En cas d'échec, vérifier `docker compose ps`.
5. Lire les logs du service concerné.

Commandes utiles :

```bash
docker compose ps
docker compose logs -f --tail=200 uptime-kuma
docker compose logs -f --tail=200 traefik
```

## Différence avec Prometheus
| Outil | Usage |
|---|---|
| Uptime Kuma | Vérifier la disponibilité et publier une status page |
| Prometheus | Collecter les métriques techniques et applicatives |
| Grafana | Visualiser les métriques Prometheus |
| Docker healthcheck | Déterminer l'état santé d'un conteneur |

## Suppression des données Uptime Kuma
Les données sont persistées dans le volume Docker `uptime-kuma-data`.

Pour supprimer les données :

```bash
docker compose down
docker volume rm infra_uptime-kuma-data
```

Selon le nom de projet Compose, le préfixe du volume peut varier. Vérifier avec :

```bash
docker volume ls
```
