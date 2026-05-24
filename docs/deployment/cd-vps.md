# CD VPS production

Ce document decrit la CD production Actionboard apres reconstruction du VPS. Le repo `infra` est le seul point qui possede les secrets SSH VPS et qui declenche un deploiement Docker Compose sur la machine.

## Flux complet

1. Un repo applicatif (`front-service`, `auth-service` ou `analysis-store-service`) recoit un tag stable `vX.Y.Z`.
2. Son workflow existant valide le tag, verifie que le commit appartient a `origin/prod`, construit l'image GHCR et publie les tags `latest`, `prod` et `X.Y.Z`.
3. Le repo applicatif appelle le workflow `deploy-prod.yml` du repo `tristanynov/infra` avec `INFRA_WORKFLOW_TOKEN`.
4. Le workflow `infra` valide le service demande, charge la cle SSH dediee et utilise `VPS_KNOWN_HOSTS` comme source de confiance.
5. Le workflow `infra` se connecte au VPS avec l'utilisateur `deploy` et demande uniquement `deploy-service <service>`.
6. La cle publique sur le VPS est restreinte par forced command vers `/usr/local/bin/actionboard-deploy-wrapper`.
7. Le wrapper refuse toute commande non autorisee et lance `/usr/local/bin/actionboard-deploy-service`.
8. Le script de deploiement met a jour `/opt/actionboard/infra`, tire les images `:prod` via Docker Compose, lance les migrations si necessaire, puis redemarre le service cible.

## Secrets applicatifs

Chaque repo applicatif doit seulement contenir :

- `INFRA_WORKFLOW_TOKEN`

Ce secret est un fine-grained PAT limite au repo `tristanynov/infra`, avec la permission minimale permettant de declencher un workflow GitHub Actions (`Actions: write`).

Les repos applicatifs ne doivent plus contenir :

- `VPS_SSH_PRIVATE_KEY`
- `VPS_HOST`
- `VPS_PORT`
- `VPS_USER`

## Secrets infra

Le repo `infra` doit contenir :

- `VPS_HOST`
- `VPS_PORT`
- `VPS_USER`
- `VPS_DEPLOY_SSH_PRIVATE_KEY_B64`
- `VPS_KNOWN_HOSTS`

Le workflow ne fait pas de `ssh-keyscan` dynamique. `VPS_KNOWN_HOSTS` doit contenir l'empreinte connue du VPS afin d'eviter un risque MITM.

## Generer la cle SSH GitHub Actions vers VPS

Depuis un poste sain sous Windows :

```powershell
ssh-keygen -t ed25519 -a 100 -f "$env:USERPROFILE\.ssh\github_actions_vps_deploy_2026" -C "github-actions-vps-deploy-2026"
```

Encoder la cle privee pour le secret `VPS_DEPLOY_SSH_PRIVATE_KEY_B64` :

```powershell
[Convert]::ToBase64String([IO.File]::ReadAllBytes("$env:USERPROFILE\.ssh\github_actions_vps_deploy_2026")) | Set-Clipboard
```

Afficher la cle publique :

```powershell
Get-Content "$env:USERPROFILE\.ssh\github_actions_vps_deploy_2026.pub"
```

## Installer les scripts VPS

Sur le VPS, le repo `infra` doit etre present dans `/opt/actionboard/infra`.

Depuis un compte administrateur du VPS :

```bash
cd /opt/actionboard/infra
git pull --ff-only origin prod
bash scripts/vps/install-deploy-scripts.sh
```

Le script installe :

- `/usr/local/bin/actionboard-deploy-wrapper`
- `/usr/local/bin/actionboard-deploy-service`

Ces fichiers sont installes en `root:root` avec le mode `0755`.

## Ajouter la forced command

Ajouter la cle publique dans `/home/deploy/.ssh/authorized_keys` avec la restriction suivante :

```text
command="/usr/local/bin/actionboard-deploy-wrapper",no-agent-forwarding,no-X11-forwarding,no-port-forwarding,no-pty ssh-ed25519 AAAA... github-actions-vps-deploy-2026
```

Le wrapper accepte uniquement :

```text
deploy-service front-service
deploy-service auth-service
deploy-service analysis-store-service
deploy-service all
```

Toute autre commande est refusee avec le code `126`.

## Recuperer VPS_KNOWN_HOSTS

Depuis le poste local, recuperer l'entree connue du VPS :

```powershell
ssh-keyscan -p 22 -H 54.37.230.148
```

Stocker la sortie exacte dans le secret GitHub `VPS_KNOWN_HOSTS` du repo `infra`.

## Tester manuellement le workflow

Depuis GitHub, lancer `Deploy prod on VPS` en `workflow_dispatch` sur la branche `prod`.

Entrer par exemple :

```text
service=front-service
version_tag=v1.0.0
source_repository=tristanynov/front-service
source_sha=0123456789abcdef0123456789abcdef01234567
```

Pour tester un redeploiement complet :

```text
service=all
```

Le workflow possede une `concurrency` globale `actionboard-prod-vps-deploy`, donc deux deploiements VPS ne s'executent pas simultanement.

## Rollback minimal

Les images de production sont referencees par les variables `*_IMAGE` du fichier `.env` du VPS. Pour revenir a une version publiee :

1. Sur le VPS, modifier la variable concernee dans `/opt/actionboard/infra/.env`, par exemple `FRONT_IMAGE=ghcr.io/tristanynov/front-service:1.2.3`.
2. Lancer le workflow `Deploy prod on VPS` avec le service concerne, ou executer manuellement en urgence :

```bash
/usr/local/bin/actionboard-deploy-service front-service
```

Pour `analysis-store-service`, verifier la compatibilite des migrations avant rollback applicatif. Un rollback de schema peut necessiter une procedure specifique selon la migration deja appliquee.

## Notes operationnelles

- L'utilisateur `deploy` doit avoir acces a Docker.
- L'utilisateur `deploy` ne doit pas avoir de droits `sudo`.
- Le repo `/opt/actionboard/infra` doit suivre la branche `prod`.
- Le script `actionboard-deploy-service` utilise `flock` sur `/tmp/actionboard-prod-deploy.lock`.
- Le script valide la configuration avec `docker compose config` avant de deployer.
