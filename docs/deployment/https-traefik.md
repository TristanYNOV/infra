# HTTPS Traefik / Let's Encrypt

Le vrai fichier `.env` existe uniquement sur le VPS et ne doit jamais etre commite. La variable `APP_DOMAIN` doit contenir le domaine public reel qui pointe vers l'adresse IP du VPS. La variable `LETSENCRYPT_EMAIL` doit contenir l'adresse de contact utilisee pour Let's Encrypt.

Avant de relancer la stack sur le VPS, verifier que les ports `80` et `443` sont ouverts dans UFW et dans les regles reseau de l'hebergeur. Le dashboard Traefik reste expose uniquement sur `127.0.0.1`.

Traefik genere automatiquement le fichier `traefik/letsencrypt/acme.json` lors de l'obtention du certificat. Le dossier `traefik/letsencrypt/` et tous les fichiers `acme.json` sont des donnees locales sensibles : ils ne doivent jamais etre commites.
