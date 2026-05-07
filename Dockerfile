FROM scratch

ARG CREATED
ARG REVISION
ARG SOURCE
ARG VERSION

LABEL org.opencontainers.image.title="infra"
LABEL org.opencontainers.image.description="Analyse Basket infrastructure bundle"
LABEL org.opencontainers.image.created="${CREATED}"
LABEL org.opencontainers.image.revision="${REVISION}"
LABEL org.opencontainers.image.source="${SOURCE}"
LABEL org.opencontainers.image.version="${VERSION}"

COPY README.md /infra/README.md
COPY Makefile /infra/Makefile
COPY docker-compose.yml /infra/docker-compose.yml
COPY .env.example /infra/.env.example
COPY docs /infra/docs
COPY monitoring /infra/monitoring
COPY observability /infra/observability
COPY postman /infra/postman
COPY rabbitmq /infra/rabbitmq
COPY traefik /infra/traefik
