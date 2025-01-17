#!/bin/bash
set -e
SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

sudo apt update -q || true
sudo apt install curl direnv bat tmux -y --no-install-recommends

# not used anymore...
# echo Installing sdkman
# curl -s "https://get.sdkman.io" | bash
# # shellcheck disable=SC1091
# source "$HOME/.sdkman/bin/sdkman-init.sh"
# sdk version

echo installing ble
curl -L https://github.com/akinomyoga/ble.sh/releases/download/nightly/ble-nightly.tar.xz | tar xJf -
mkdir -p ~/.local/share/blesh
cp -Rf ble-nightly/* ~/.local/share/blesh/
rm -rf ble-nightly

# https://alacritty.org/
sudo snap install alacritty --classic 

mkdir -p ~/.local/bin
curl -o up https://github.com/akavel/up/releases/latest/download/up
mv up ~/.local/bin
chmod +x ~/.local/bin/up

curl https://sh.rustup.rs -sSf | sh -s -- -y

cargo install --locked navi

echo installing powerline
pipx install powerline-shell

SOURCE_LINE="source \"$SCRIPTPATH/bashrc_addons\""
echo adding custom config to .bashrc: "$SOURCE_LINE"
grep -qxF "$SOURCE_LINE" "$HOME/.bashrc"|| echo "$SOURCE_LINE" >> "$HOME/.bashrc"

echo setting up git aliases
./gitconfig_alias.sh
