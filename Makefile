COMPOSE=docker compose
CORE_FILES=-f docker-compose.yml
DIRECT_FILES=-f docker-compose.yml -f docker-compose.direct.yml

.PHONY: up down logs ps health up-direct

up:
	$(COMPOSE) $(CORE_FILES) up -d

down:
	$(COMPOSE) $(DIRECT_FILES) down --remove-orphans

up-direct:
	$(COMPOSE) $(DIRECT_FILES) up -d

logs:
	$(COMPOSE) $(CORE_FILES) logs -f --tail=200

ps:
	$(COMPOSE) $(CORE_FILES) ps

health:
	@echo "[health] Traefik"
	@curl -fsS "http://localhost:$${TRAEFIK_WEB_PORT:-80}/" >/dev/null && echo "OK /" || echo "KO /"
	@echo "[health] Auth via Traefik"
	@curl -fsS "http://localhost:$${TRAEFIK_WEB_PORT:-80}/api/auth/health" >/dev/null && echo "OK /api/auth/health" || echo "KO /api/auth/health"
