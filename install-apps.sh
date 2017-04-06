#! /usr/bin/env bash

set -e

# Spotify
sudo dnf config-manager --add-repo=http://negativo17.org/repos/fedora-spotify.repo
sudo dnf install spotify -y

# Telegram

wget https://telegram.org/dl/desktop/linux
tar xf linux
rm linux
mkdir -p ~/.telegram
sudo mv Telegram/Telegram /usr/local/bin/telegram
sudo mv Telegram/Updater /usr/local/bin/Updater
rm -rf Telegram

# Corebird

sudo dnf install corebird -y
