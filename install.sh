#!/bin/bash
set -e
SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

sudo apt update -q || true
sudo apt install curl direnv exa -y --no-install-recommends

echo Installing sdkman
curl -s "https://get.sdkman.io" | bash
# shellcheck disable=SC1091
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk version

echo installing ble
curl -L https://github.com/akinomyoga/ble.sh/releases/download/nightly/ble-nightly.tar.xz | tar xJf -
mkdir -p ~/.local/share/blesh
cp -Rf ble-nightly/* ~/.local/share/blesh/
rm -rf ble-nightly

echo installing powerline
pip3 install powerline-shell

SOURCE_LINE="source \"$SCRIPTPATH/bashrc_addons\""
echo adding custom config to .bashrc: "$SOURCE_LINE"
grep -qxF "$SOURCE_LINE" "$HOME/.bashrc"|| echo "$SOURCE_LINE" >> "$HOME/.bashrc"

echo setting up git aliases
./gitconfig_alias.sh
