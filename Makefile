COMPOSE=docker compose
CORE=-f docker-compose.yml

.PHONY: up down logs ps pull restart config health

up:
	$(COMPOSE) $(CORE) up -d

down:
	$(COMPOSE) $(CORE) down --remove-orphans

logs:
	$(COMPOSE) $(CORE) logs -f --tail=200

ps:
	$(COMPOSE) $(CORE) ps

pull:
	$(COMPOSE) $(CORE) pull

restart:
	$(COMPOSE) $(CORE) restart

config:
	$(COMPOSE) $(CORE) config

health:
	@echo "[check] front via Traefik" && curl -fsS "http://localhost:$${TRAEFIK_WEB_PORT:-80}/healthz" >/dev/null && echo "OK front" || echo "KO front"
	@echo "[check] auth via Traefik" && curl -fsS "http://localhost:$${TRAEFIK_WEB_PORT:-80}/health" >/dev/null && echo "OK auth" || echo "KO auth"
