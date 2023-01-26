#!/bin/bash
set -e

sudo apt update || true
sudo apt install curl

echo Installing sdkman
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk version

echo installing ble
curl -L https://github.com/akinomyoga/ble.sh/releases/download/nightly/ble-nightly.tar.xz | tar xJf -
mkdir -p ~/.local/share/blesh
cp -Rf ble-nightly/* ~/.local/share/blesh/
rm -rf ble-nightly


echo installing powerline
pip3 install powerline-shell

grep -qxF 'source "$HOME/my_custom_settings/bashrc_addons"' "$HOME/.bashrc" || echo 'source "$HOME/my_custom_settings/bashrc_addons"' >> "$HOME/.bashrc"

./gitconfig_alias.sh
