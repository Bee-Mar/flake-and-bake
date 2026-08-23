#!/usr/bin/env bash
# Stages solutions/ over exercises/ in a temp copy of the repo and runs every
# check — proves each exercise is solvable and each check is correct.
set -euo pipefail

root="$(cd "$(dirname "$0")/.." && pwd)"
tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT

cp -r "$root"/{exercises,lib,flake.lock} "$tmp/"
# Overlay solutions on top of the exercise tree (keeps vendored srcs like muffin/)
(cd "$root/solutions" && find . -type f -exec install -D {} "$tmp/exercises/{}" \;)

cd "$tmp"
exec bake run all
