only chsh if it isn't zsh already

only install gnome extensions if they aren't installed already
maybe install a list of gnome extensions programatically?

https://community.frame.work/t/linux-battery-life-tuning/6665/156.
/etc/default/grub.d/post-resume-power-draw-workaround.cfg
contents: 'GRUB_CMDLINE_LINUX_DEFAULT="${GRUB_CMDLINE_LINUX_DEFAULT} nvme.noacpi=1"'


turned off PS2 emulation in BIOS

https://community.frame.work/t/arch-linux-on-the-framework-laptop/3843
https://wiki.archlinux.org/title/Framework_Laptop
add kernel parameters
sudo vim /etc/default/grub
add to `GRUB_CMDLINE_LINUX_DEFAULT`:
```
mem_sleep_default=deep acpi_osi="Windows 2020"
```

https://community.frame.work/t/using-the-ax210-with-linux-on-the-framework-laptop/1844/21
/etc/modprobe.d/iwlwifi.conf
```
options iwlwifi disable_11ax=Y
```
this disables the new, unstable features of the wifi card and after reboot, speeds are much faster and it is more stable

https://linux-hardware.org/?probe=8c2272b18b




yay -S nautilus-typeahead



yay -S docker
sudo ip link add name docker0 type bridge
sudo ip addr add dev docker0 172.17.0.1/16
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker $USER

yay -S nix devbox
sudo usermod -aG nix-users $USER
sudo systemctl enable nix-daemon
#reboot
nix-channel --add https://nixos.org/channels/nixpkgs-unstable
nix-channel --update




git clone https://github.com/ivyl/obs-lv2.git
cd obs-lv2
meson --prefix=/usr build/
ninja -C build
sudo ninja -C build install






sudo crontab -l
@reboot /etc/at-reboot

https://community.frame.work/t/a-qmk-configurable-keyboard/2086/16
https://www.howett.net/posts/2021-12-framework-ec/#3e0c---keyboard-mapping
https://www.howett.net/data/framework_matrix
yay -S fw-ectool-git
RAlt = 0, 3
RCtrl = 0, 12
Caps Lock = 4, 4

RUN ON STARTUP:
#                             0, 3  Home
#                             v  v  v
sudo ectool raw 0x3E0C d1,d1,b0,b3,w6C #RAlt -> Home

#                             0, 12 End
#                             v  v  v
sudo ectool raw 0x3E0C d1,d1,b0,bc,w69 #RCtrl -> End


#                             4, 4  Ctrl
#                             v  v  v
sudo ectool raw 0x3E0C d1,d1,b4,b4,w14 #Caps Lock -> Ctrl
#                             4, 4  Caps Lock
#                             v  v  v
sudo ectool raw 0x3E0C d1,d1,b4,b4,w58 #Caps Lock -> back to Caps Lock


https://keyboard-test.space/
0
1   F9
2   F7
3   F5
4   F3
5   F1
6   F2
7   F12
8
9   F10
A   F8
B   F6
C   F4
D   tab
E   ~
F   =
10
11  alt
12  shift
13  left mouse click
14  ctrl
15  Q
16  1
17
18
19
1A  Z
1B  S
1C  A
1D  W
1E  2
1F
20
21  C
22  X
23  D
24  E
25  4
26  3
27  left mouse click
28
29  space
2A  V
2B  F
2C  T
2D  R
2E  5
2F  tools
30
31  N
32  B
33  H
34  G
35  Y
36  6
37  left mouse click
38
39
3A  M
3B  J
3C  U
3D  7
3E  8
3F  left mouse click
40
41  ,
42  K
43  I
44  O
45  0
46  9
47
48
49  .
4A  /
4B  L
4C  ;
4D  P
4E  -
4F
50
51  left mouse click
52  '
53
54  [
55  =
56
57
58  caps lock
59  shift
5A  enter
5B  ]
5C  \
5D
5E
5F  left mouse click
60
61
62  left mouse click
63  left mouse click
64  <undefined>
65  backspace
66
67  <undefined>
68
69  end
6A  left mouse click
6B  left arrow key
6C  home
6D  numpad .
6E
6F
70  ins
71  del
72  down arrow key
73  <undefined>
74  right arrow key
75  up arrow key
76  escape
77  num lock
78  F11
79  numpad +
7A  page down
7B  numpad -
7C  numpad *
7D  page up
7E  scroll lock
7F  print screen
80
81
82
83  F7
84
85
86
87
88
89
8A
8B
8C
8D
8E
8F
90
91
92
93
94
95
96
97
98
99
9A
9B
9C
9D
9E
9F
100 escape stays on
101 escape stays on, F9
102 escape stays on, F7
103 escape stays on, F5
104 escape stays on, F3
105 escape stays on, F1
106 escape stays on, F2
107 escape stays on, F12
108 escape stays on
109 escape stays on, F10



sudo nano /usr/share/X11/xkb/symbols/shift
partial modifier_keys
xkb_symbols "both_capslock" {
  include "shift(lshift_both_capslock)"
  include "shift(rshift_both_capslock)"
  key <RALT> { [ Home ] };
  key <RCTL> { [ End ] };
  key <CAPS> { [ Control_R ] };
};




for latitude:
sudo nano /usr/share/X11/xkb/symbols/pc
original:
```
    key  <INS> {        [  Insert               ]       };
    key <HOME> {        [  Home                 ]       };
    key <PGUP> {        [  Prior                ]       };
    key <DELE> {        [  Delete               ]       };
    key  <END> {        [  End                  ]       };
    key <PGDN> {        [  Next                 ]       };
```
new:
```
    key  <INS> {        [  Insert               ]       };
    key <HOME> {        [  Prior                 ]       };
    key <PGUP> {        [  Home                ]       };
    key <DELE> {        [  Delete               ]       };
    key  <END> {        [  Next                  ]       };
    key <PGDN> {        [  End                 ]       };
```


use a script to add keyboard shortcuts:
https://unix.stackexchange.com/questions/323160/gnome3-adding-keyboard-custom-shortcuts-using-dconf-without-need-of-logging

user@latitude-7490:~/git/johanvandegriff/dotfiles$ gnome-extensions list
ding@rastersoft.com
ubuntu-appindicators@ubuntu.com
ubuntu-dock@ubuntu.com
user@latitude-7490:~/git/johanvandegriff/dotfiles$ gnome-extensions disable ubuntu-dock@ubuntu.com
end latitude

https://www.pragmaticlinux.com/2021/06/manually-install-a-gnome-shell-extension-from-a-zip-file/
https://extensions.gnome.org/extension/1031/topicons/
#copied from /etc/pam.d/polkit-1 into:
#sudo nano /etc/pam.d/sxlock
#auth            sufficient      pam_unix.so try_first_pass likeauth nullok
#auth            sufficient      pam_fprintd.so


https://dev.to/mattstratton/making-powerline-work-in-visual-studio-code-terminal-1m7


~/nextcloud/configs/install


sudo pacman-mirrors --fasttrack && sudo pacman -Syyu



# Old
/etc/tlp.conf
PCIE_ASPM_ON_BAT=powersupersave

power save mode
powertop --auto-tune
undervolt



https://community.frame.work/t/ubuntu-21-04-on-the-framework-laptop/2722/57
sudo vim /etc/modprobe.d/alsa-base.conf
```
options snd-hda-intel model=dell-headset-multi
```
works after reboot :)

