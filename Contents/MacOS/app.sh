#!/usr/bin/env bash
# launch the cocoa app
cd "$(dirname "$0")"

DYLD_FRAMEWORK_PATH="/Applications/WebKit.app/Contents/Frameworks/10.7"

if [[ ! -d "$DYLD_FRAMEWORK_PATH" ]]; then
  "$(dirname "$0")/webview" -url "file://$(dirname "$0")/../Resources/error-install-webkit.html"
  open "http://nightly.webkit.org/"
  exit 123
fi

DEVTOOLS="$(../Resources/download-devtools.sh)/devtools.html"

URL="file://$(dirname "$0")/../Resources/index.html?devtools=$DEVTOOLS"

DYLD_FRAMEWORK_PATH="$DYLD_FRAMEWORK_PATH" ./webview -url "$(echo "$URL" |sed 's/ /%20/g')"
