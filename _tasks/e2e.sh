#!/usr/bin/env bash

set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
TEMPLATE_DIR="$DIR"/..
ANSWERS_FILE=.copier-answers.yml

fail() {
  local message="$1"

  echo "$message" >&2
  exit 1
}

tempRepo="$(mktemp -d "${TMPDIR:-/tmp}/flask-template.e2e.XXXXXX")"

if [[ -z ${E2E_DEBUG:-} ]]; then
  trap 'rm -rf "${tempRepo}"' EXIT
fi
cp "$DIR/$ANSWERS_FILE" "$tempRepo"
echo "_src_path: \"$TEMPLATE_DIR\"" >>"$tempRepo/$ANSWERS_FILE"

mise trust "$tempRepo/mise.toml"
trap 'mise trust --untrust "$tempRepo/mise.toml"' EXIT

echo "E2E: Running copier to destination '$tempRepo'"
copier recopy --skip-answered --trust "$tempRepo"

readmeLength="$(wc -c "$tempRepo"/README.md | awk '{print $1}')"
if [[ "$readmeLength" != 0 ]]; then
  fail "Expected empty README.md from 'uv init', got $readmeLength characters"
fi
