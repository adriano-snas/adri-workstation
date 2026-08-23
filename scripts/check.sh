#!/usr/bin/env bash
set -Eeuo pipefail
cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.."
shellcheck workstation scripts/check.sh
docker compose --env-file <(printf 'POSTGRES_PASSWORD=x\nREDIS_PASSWORD=x\nN8N_ENCRYPTION_KEY=x\nWEBUI_SECRET_KEY=x\n') config --quiet
printf 'Validação concluída.\n'

