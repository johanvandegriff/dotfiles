# Dotfiles
A repo to manage the setup of my computers. Based on [Nikita's dotfiles repo](https://github.com/nikitawootten/.dotfiles).

## Running
```bash
./run.sh framework
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
 - [framework](./framework.yaml): My framework laptop running Manjaro Linux.

### Roles
 - [environment](./roles/environment): environment variables for terminal and GUI alike
 - [zsh](./roles/zsh): install and configure the zsh shell
 - [git](./roles/git): install and configure git (the config file contains my name, so if you fork this repo, change it)
 - [tmux](./roles/tmux): install and configure tmux
 - [wezterm](./roles/wezterm): install and configure wezterm, a terminal with some cool features such as image support
 - [nethack](./roles/nethack): install and configure nethack
 - [template](./roles/template): a blank slate for installing and configuring something (just replace ? with the software name)
