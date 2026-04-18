#!/usr/bin/env bash
# setp stric mod
set -euo pipefail

# gloabal vars
OS_TYPE=""
PKG_MGR=""
TMP_DIR=$(mktemp -d)

# clenup trap
cleanup() {
  rm -rf "$TMP_DIR"
}
trap cleanup EXIT
