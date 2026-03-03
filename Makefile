COMPOSE=docker compose
CORE=-f docker-compose.yml
DIRECT=-f docker-compose.yml -f docker-compose.direct.yml
WATCHTOWER=--profile watchtower

.PHONY: up up-watchtower up-direct down logs logs-watchtower ps pull restart health

up:
	$(COMPOSE) $(CORE) up -d

up-watchtower:
	$(COMPOSE) $(CORE) $(WATCHTOWER) up -d

up-direct:
	$(COMPOSE) $(DIRECT) up -d

down:
	$(COMPOSE) $(DIRECT) down --remove-orphans

logs:
	$(COMPOSE) $(CORE) logs -f --tail=200

logs-watchtower:
	$(COMPOSE) $(CORE) $(WATCHTOWER) logs -f --tail=200 watchtower

ps:
	$(COMPOSE) $(CORE) ps

pull:
	$(COMPOSE) $(CORE) pull

restart:
	$(COMPOSE) $(CORE) restart

health:
	@echo "[check] front via Traefik" && curl -fsS "http://localhost:$${TRAEFIK_WEB_PORT:-80}/" >/dev/null && echo "OK front" || echo "KO front"
	@echo "[check] auth via Traefik" && curl -fsS "http://localhost:$${TRAEFIK_WEB_PORT:-80}/api/auth/health" >/dev/null && echo "OK auth" || echo "KO auth"
