#!/usr/bin/env bash
set -Eeuo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

sudo install -o root -g root -m 0755 \
  "${SCRIPT_DIR}/actionboard-deploy-wrapper" \
  /usr/local/bin/actionboard-deploy-wrapper

sudo install -o root -g root -m 0755 \
  "${SCRIPT_DIR}/actionboard-deploy-service" \
  /usr/local/bin/actionboard-deploy-service

echo "Installed:"
ls -lah /usr/local/bin/actionboard-deploy-wrapper /usr/local/bin/actionboard-deploy-service
