#!/usr/bin/env bash
set -x
set -eo pipefail

if ! [ -x "$(command -v sqlx)" ] || ! [ -x "$(command -v cargo)" ]; then
  echo >&2 "Error: sqlx or cargo is not installed."
  echo >&2 "Use:"
  echo >&2 "    cargo install --version='~0.8' sqlx-cli \
    --no-default-features --features rustls,postgres"
  echo >&2 "to install it."
  exit 1
fi

cargo sqlx prepare --workspace -- --all-targets
