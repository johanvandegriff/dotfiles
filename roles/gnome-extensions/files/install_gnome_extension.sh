#!/usr/bin/env bash
#https://askubuntu.com/questions/1152583/install-gnome-shell-extensions-from-terminal

uuid="$1"
#uuid=dash-to-dock@micxgx.gmail.com
#pk=307

if [[ -d "$HOME/.local/share/gnome-shell/extensions/$uuid" ]]; then
  echo "already installed, exiting"
  exit 0
fi

# 1. GNOME shell version
shell_version=$(gnome-shell --version | cut -d' ' -f3)

# 2. Fetch extension info (for the given shell version)
info_json=$(curl -sS "https://extensions.gnome.org/extension-info/?uuid=$uuid&shell_version=$shell_version")
# 2.a instead of ?uuid=$uuid you can use ?pk=$pk

# 3. Extract download url from the json with jq
download_url=$(echo $info_json | jq ".download_url" --raw-output)

# 4. Install the extension
gnome-extensions install "https://extensions.gnome.org$download_url"
# 4.a ... or download it first, then install
#curl -sL "https://extensions.gnome.org$download_url" -o $uuid.zip
#gnome-extensions install $uuid.zip
# 4.a.i ... or manually extract the zip
#mkdir -p ~/.local/share/gnome-shell/extensions/$uuid
#unzip $uuid.zip -d ~/.local/share/gnome-shell/extensions/$uuid
