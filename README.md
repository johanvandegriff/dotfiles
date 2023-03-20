# Dotfiles
A repo to manage the setup of my computers. Based on [Nikita's dotfiles repo](https://github.com/nikitawootten/.dotfiles).

## Running
```bash
./run.sh
```
OR
```bash
ansible-playbook -K framework.yaml
```

## Structure
I manage my dotfiles in Ansible using a system of *plays* and *roles*.
 - I use *plays* to manage device specific configuration.
These *plays* act as "entrypoint" of my configuration.
 - I use *roles* to manage application configurations.
 - A *play* is composed of multiple *roles*, with some extra configuration on top.

### Plays
 - [framework](./framework.yaml): My framework laptop running Ubuntu (script also works on Manjaro), with Gnome Wayland.
 - [latitude](./latitude.yaml): My dell latitude 7490 work laptop running Ubuntu, with Gnome Wayland.

### Roles
 - [utils](./roles/utils): install basic utilities that I always need
 - [environment](./roles/environment): environment variables for terminal and GUI alike
 - [zsh](./roles/zsh): install and configure the zsh shell
 - [git](./roles/git): install and configure git (the config file contains my name, so if you fork this repo, change it)
 - [tmux](./roles/tmux): install and configure tmux
 - [wezterm](./roles/wezterm): install and configure wezterm, a terminal with some cool features such as image support
 - [nethack](./roles/nethack): install and configure nethack
 - [gnome-settings](./roles/gnome-settings): configure gnome to use 4 finger swipe for workspace, 3 finger swipe for various keybinds, make caps lock ctrl, enable window focus on hover, set up workspace keybinds, etc.
 - [nix](./roles/nix): install the Nix package manager (not currently used)
 - [framework-ssd-trim](./roles/framework-ssd-trim): enable SSD trim for booting from USB on the framework laptop
 - [template](./roles/template): a blank slate for installing and configuring something (just copy it and replace ? with the software name)
