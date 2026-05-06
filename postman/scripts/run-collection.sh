#!/usr/bin/env sh
set -eu

SCRIPT_DIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
POSTMAN_DIR="$(dirname "$SCRIPT_DIR")"

newman run \
  "$POSTMAN_DIR/analyse-basket-infra.postman_collection.json" \
  -e "$POSTMAN_DIR/analyse-basket-infra.local.postman_environment.json" \
  "$@"
