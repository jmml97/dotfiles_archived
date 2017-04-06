#! /bin/bash

# We download things on tmp
cd /tmp

echo "Downloading Iosevka"
wget $(curl -s https://api.github.com/repos/be5invis/Iosevka/releases/latest | grep 'browser_' | cut -d\" -f4 | grep 01)

mkdir -p ~/.fonts/Iosevka

echo "Unzipping Iosevka"
unzip $(ls | grep iosevka) -d ~/.fonts/Iosevka

echo "Updating font cache"
sudo fc-cache
