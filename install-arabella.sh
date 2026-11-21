#!/bin/zsh
# Installs Arabella 0.7.0 into /Applications from this repo's GitHub Releases.
#   curl -fsSL https://raw.githubusercontent.com/VitaliyNikolaev777/arabella-daughter/main/install-arabella.sh | zsh
# The Pure edition (no bundled helpers):
#   curl -fsSL https://raw.githubusercontent.com/VitaliyNikolaev777/arabella-daughter/main/install-arabella.sh | ARABELLA_EDITION=pure zsh
set -euo pipefail

VERSION="0.7.0"
if [[ "${ARABELLA_EDITION:-packed}" == pure ]]; then
  DMG="Arabella-Pure-$VERSION.dmg"
  SHA="ffdb905ae5f583d4ad1ec16a78c4a15302b57b78c50b5b6665537976e3dc6203"
  APP="Arabella Pure.app"; PROC="Arabella Pure"
else
  DMG="Arabella-$VERSION.dmg"
  SHA="732916caa1069ec1f7ef65a5dd01905246e900ca5758f230cb57e3e3f08f0d72"
  APP="Arabella.app"; PROC="Arabella"
fi
URL="https://github.com/VitaliyNikolaev777/arabella-daughter/releases/download/v$VERSION/$DMG"
DEST="${ARABELLA_INSTALL_DIR:-/Applications}"

MAJOR=$(sw_vers -productVersion | cut -d. -f1)
if (( MAJOR < 14 )); then
  echo "✗ Arabella needs macOS 14 Sonoma or newer (this Mac has $(sw_vers -productVersion))."; exit 1
fi

TMP=$(mktemp -d)
trap 'hdiutil detach "$TMP/mnt" -quiet 2>/dev/null || true; rm -rf "$TMP"' EXIT

echo "Downloading $DMG…"
curl -fL --progress-bar -o "$TMP/$DMG" "$URL"
if [[ $(shasum -a 256 "$TMP/$DMG" | cut -d' ' -f1) != "$SHA" ]]; then
  echo "✗ The download doesn't match the published checksum. Nothing was installed."; exit 1
fi

hdiutil attach "$TMP/$DMG" -nobrowse -readonly -mountpoint "$TMP/mnt" -quiet
if [[ $DEST == /Applications ]]; then
  # Updating: close the running copy first. Her data stays.
  pkill -x "$PROC" 2>/dev/null || true
  for _ in {1..50}; do pgrep -x "$PROC" >/dev/null || break; sleep 0.1; done
fi
rm -rf "$DEST/$APP"
cp -R "$TMP/mnt/$APP" "$DEST/"
xattr -cr "$DEST/$APP" 2>/dev/null || true
echo "✓ Installed $DEST/$APP"
[[ $DEST == /Applications ]] && open "$DEST/$APP"
true
