#!/usr/bin/env bash

function success () {
  echo "$DEVTOOLS_PATH"
  exit 0
}

ROOT="$HOME/Library/Application Support/Standalone Web Inspector"
mkdir -p "$ROOT"
DEVTOOLS_PATH="$ROOT/devtools_frontend"
DEVTOOLS_ZIP="${TMPDIR}devtools_frontend.zip"

[[ -d "$DEVTOOLS_PATH" ]] && success

LAST_CHANGE=$(curl -s http://commondatastorage.googleapis.com/chromium-browser-continuous/Mac/LAST_CHANGE)
DEVTOOLS_ZIP_URL="http://commondatastorage.googleapis.com/chromium-browser-continuous/Mac/$LAST_CHANGE/devtools_frontend.zip"

[[ -f "$DEVTOOLS_ZIP" ]] || curl --output "$DEVTOOLS_ZIP" --silent --location "$DEVTOOLS_ZIP_URL"
unzip "$DEVTOOLS_ZIP" -d "$DEVTOOLS_PATH"
echo $LAST_CHANGE > "$DEVTOOLS_PATH.LAST_CHANGE.txt"

success
