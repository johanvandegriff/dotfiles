https://community.frame.work/t/enable-trim-unmap-on-the-storage-expansion-card/8885
echo 'ACTION=="add|change", ATTRS{idVendor}=="13fe", ATTRS{idProduct}=="6500", SUBSYSTEM=="scsi_disk", ATTR{provisioning_mode}="unmap"' | sudo tee /etc/udev/rules.d/10-framework-sec-trim.rules


turned off PS2 emulation in BIOS

https://community.frame.work/t/arch-linux-on-the-framework-laptop/3843
https://wiki.archlinux.org/title/Framework_Laptop
add kernel parameters
sudo vim /etc/default/grub
add to `GRUB_CMDLINE_LINUX_DEFAULT`:
```
mem_sleep_default=deep acpi_osi="Windows 2020"
```

https://community.frame.work/t/ubuntu-21-04-on-the-framework-laptop/2722/57
sudo vim /etc/modprobe.d/alsa-base.conf
```
options snd-hda-intel model=dell-headset-multi
```
works after reboot :)

https://community.frame.work/t/using-the-ax210-with-linux-on-the-framework-laptop/1844/21
/etc/modprobe.d/iwlwifi.conf
```
options iwlwifi disable_11ax=Y
```
this disables the new, unstable features of the wifi card and after reboot, speeds are much faster and it is more stable

https://linux-hardware.org/?probe=8c2272b18b







sudo nano /usr/share/X11/xkb/symbols/shift
partial modifier_keys
xkb_symbols "both_capslock" {
  include "shift(lshift_both_capslock)"
  include "shift(rshift_both_capslock)"
  key <RALT> { [ Home ] };
  key <RCTL> { [ End ] };
  key <CAPS> { [ Control_R ] };
};


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
