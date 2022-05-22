Gnome: external monitors no crash, workspace only on primary, ssh keys, tiling (pop shell), easy nextcloud calendar/contacts/files
Cons: no tray icons, doesn't always remember screen layout, dynamic workspaces is glitchy

KDE: clipboard manager, tiling (bismuth)
Cons: crash when dock unplug

Sway: external monitors no crash, tiling, assign workspace to external monitor
Cons: screens blank after replug, need to set up volume/brightness

https://www.beatworm.co.uk/blog/keyboards/gnome-wayland-xkb
gsettings set org.gnome.desktop.input-sources xkb-options "['shift:both_capslock']"
https://www.reddit.com/r/pop_os/comments/gc88xw/2004_focus_on_mouse_hover_always_autoraises_window/
gsettings set org.gnome.desktop.wm.preferences focus-mode sloppy
https://www.pragmaticlinux.com/2021/06/manually-install-a-gnome-shell-extension-from-a-zip-file/
https://extensions.gnome.org/extension/1031/topicons/
#copied from /etc/pam.d/polkit-1 into:
#sudo nano /etc/pam.d/sxlock
#auth            sufficient      pam_unix.so try_first_pass likeauth nullok
#auth            sufficient      pam_fprintd.so

https://askubuntu.com/questions/332264/13-04-more-than-four-workspace-shortcuts-in-gnome-flashback-no-effects#427448
dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-1 "['<Super>grave']"
dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-2 "['<Super>1']"
dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-3 "['<Super>2']"
dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-4 "['<Super>3']"
dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-5 "['<Super>4']"
dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-6 "['<Super>5']"
dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-7 "['<Super>6']"
dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-8 "['<Super>7']"
dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-9 "['<Super>8']"
dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-10 "['<Super>9']"
dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-11 "['<Super>0']"

dconf write /org/gnome/desktop/wm/keybindings/move-to-workspace-1 "['<Alt><Super>grave']"
dconf write /org/gnome/desktop/wm/keybindings/move-to-workspace-2 "['<Alt><Super>1']"
dconf write /org/gnome/desktop/wm/keybindings/move-to-workspace-3 "['<Alt><Super>2']"
dconf write /org/gnome/desktop/wm/keybindings/move-to-workspace-4 "['<Alt><Super>3']"
dconf write /org/gnome/desktop/wm/keybindings/move-to-workspace-5 "['<Alt><Super>4']"
dconf write /org/gnome/desktop/wm/keybindings/move-to-workspace-6 "['<Alt><Super>5']"
dconf write /org/gnome/desktop/wm/keybindings/move-to-workspace-7 "['<Alt><Super>6']"
dconf write /org/gnome/desktop/wm/keybindings/move-to-workspace-8 "['<Alt><Super>7']"
dconf write /org/gnome/desktop/wm/keybindings/move-to-workspace-9 "['<Alt><Super>8']"
dconf write /org/gnome/desktop/wm/keybindings/move-to-workspace-10 "['<Alt><Super>9']"
dconf write /org/gnome/desktop/wm/keybindings/move-to-workspace-11 "['<Alt><Super>0']"

https://www.reddit.com/r/gnome/comments/qrhu0e/guide_to_customize_gnome_40_touchpad_gestures_on/
sudo cp /usr/lib64/gnome-shell/libgnome-shell.so{,.old}
sudo vim /usr/lib64/gnome-shell/libgnome-shell.so
REPLACE
const GESTURE_FINGER_COUNT = 3;
WITH
const GESTURE_FINGER_COUNT = 4;
DONE
yay -S ydotool-bin libinput-gestures gestures
sudo gpasswd -a $USER input

https://github.com/ReimuNotMoe/ydotool/issues/73
sudo nano /lib/systemd/system/ydotool.service
REPLACE
ExecStart=/usr/local/bin/ydotoold
WITH
ExecStart=/usr/local/bin/ydotoold --socket-perm 0666
DONE

sudo systemctl start ydotool.service
sudo systemctl enable ydotool.service
log out and back in

to get the keycodes:
nano /usr/include/linux/input-event-codes.h

open "gestures" app
3 finger swipe up
/usr/local/bin/ydotool key 29:1 15:1 15:0 29:0 #ctrl+tab
3 finger swipe down
/usr/local/bin/ydotool key 29:1 42:1 15:1 15:0 42:0 29:0 #ctrl+shift+tab
3 finger swipe right
/usr/local/bin/ydotool key 56:1 105:1 105:0 56:0 #alt+left
3 finger swipe left
/usr/local/bin/ydotool key 56:1 106:1 106:0 56:0 #alt+right
2 finger pinch out
/usr/local/bin/ydotool key 29:1 13:1 13:0 29:0 #ctrl+=
2 finger pinch in
/usr/local/bin/ydotool key 29:1 12:1 12:0 29:0 #ctrl+-


libinput-gestures-setup service
systemctl --user enable libinput-gestures.service
systemctl --user start libinput-gestures.service
might not need this -> sudo gpasswd -a $USER input


Configuration files are at:
   /etc/libinput-gestures.conf (system wide default)
   $HOME/.config/libinput-gestures.conf (optional per user)



