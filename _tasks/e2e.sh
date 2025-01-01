#!/usr/bin/env bash

set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
TEMPLATE_DIR="$DIR"/..
ANSWERS_FILE=.copier-answers.yml

tempRepo="$(mktemp -d "${TMPDIR:-/tmp}/flask-template.e2e.XXXXXX")"

#trap 'rm -rf "${tempRepo}"' EXIT
cp "$DIR/$ANSWERS_FILE" "$tempRepo"
echo "_src_path: \"$TEMPLATE_DIR\"" >>"$tempRepo/$ANSWERS_FILE"

echo "E2E: Running copier to destination '$tempRepo'"
copier recopy --skip-answered --trust "$tempRepo"
