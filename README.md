# my dot Files

> this repo is a container for my dot files, both on MacOS and ArchLinux 🍺️

## Table of Contents
- [my dot Files](#my-dot-files)
  - [0. TL;DR](#0-tldr)
  - [1.Intro](#1intro)
    - [1.1 How it works](#11-how-it-works)
    - [1.2 Config files under `/home/username/`](#12-config-files-under-homeusername)
    - [1.3 Config files under `/home/username/.config`](#13-config-files-under-homeusernameconfig)
  - [2.Usage](#2usage)
    - [2.1. Install](#21-install)
    - [2.2 Add new config file](#22-add-new-config-file)
    - [2.3 Automatic backup old config files](#23-automatic-backup-old-config-files)
  - [3.Todo](#3todo)

## 0. TL;DR
- run command below to install, first check your os version and checkout the branch you need
```bash
# git clone this repo
git clone https://github.com/Albert26193/my-dotfiles

# checkout the branch you need
git checkout linux

# cd to this repo
cd ./my-dotfiles/

# run install script
bash ./scripts/install.sh
```

## 1.Intro
### 1.1 How it works
- it maintains a list of config files, by make symbolic link to the real config file
- generally, the config files can be divied into two categories
  - dotfiles under home directory, like `/home/username/.vimrc`
  - dotfiles under config directory, like `/home/username/.config/alacritty.yml`

### 1.2 Config files under `/home/username/`
- these files are under `./dotfiles/home_dotfiles`
```shell
# dotfiles under /home/username directory
$ tree -a ./dotfiles/home_dotfiles

home_dotfiles
├── .screenlayout.sh    # screenlayout script for i3 xrander
├── .tmux.conf          # tmux config file
├── .vimrc              # vim config file
├── .xinitrc            # xinit config file for X11 and i3
├── .xprofile           # xprofile config file for X11 and i3
├── .Xresources         # Xresources config file for X11 and i3
└── .zshrc              # zsh config file with oh-my-zsh
```

| config file   | category | description                    |  website |
| ------------- | -------- | ------------------------------ | ---------------- |
| .screenlayout.sh | i3/xrandr | screenlayout script for i3wm using xrandr | https://www.x.org/wiki/ |
| .tmux.conf       | tmux     | tmux configuration file        | https://github.com/tmux/tmux |
| .vimrc           | Vim      | Vim configuration file. I try keep it simple, if you need complex features, use neovim           | https://www.vim.org |
| .xinitrc         | X11/i3   | an init for ~/.Xresources to load  | https://www.x.org/wiki/ |
| .xprofile        | X11/i3   | add some fcitx5 settings for X11 and i3wm | https://www.x.org/wiki/ |
| .Xresources      | X11/i3   | configuration file for X11 and i3wm, add 4k resolution and some basic xft setting for i3wm | https://www.x.org/wiki/ |
| .zshrc           | Zsh      | zsh configuration file with oh-my-zsh | https://ohmyz.sh |

### 1.3 Config files under `/home/username/.config`
- these files are under `./dotfiles/config_dotfiles`
```shell
# dotfiles under /home/username/.config directory
$ tree -a ./dotfiles/config_dotfiles

config_dotfiles
├── alacritty.yml   # alacritty config file, alacritty is a terminal emulator
├── dunst
│   └── dunstrc     # dunst config file, dunst is a notification daemon
├── fontconfig
│   └── fonts.conf  # basic font config file for linux
├── i3
│   └── config      # i3wm config file, i3wm is a tiling window manager
├── i3status
│   └── config      # i3status config file, i3status is a status bar for i3wm
└── rofi
    └── config.rasi # rofi config file, rofi is a window switcher, application launcher
```

| config file       | category | description                                       | official website                  |
| ----------------- | -------- | ------------------------------------------------- | --------------------------------- |
| alacritty.yml     | Terminal | Alacritty configuration file                       | https://github.com/alacritty/alacritty |
| dunstrc           | Notification | Dunst configuration file                       | https://dunst-project.org/ |
| fonts.conf        | Font     | Basic font configuration file for Linux            | https://wiki.archlinux.org/title/font_configuration |
| i3/config         | Window Manager | i3wm configuration file                       | https://i3wm.org/ |
| i3status/config   | Status Bar | i3status configuration file                   | https://github.com/i3/i3status |
| rofi/config.rasi  | Window Switcher | Rofi configuration file                     | https://github.com/davatorium/rofi |

## 2.Usage

> you should check your os version and install the software you need before use this repo
> if you are using linux, checkout the branch `linux`
> if you are using macos, checkout the branch `macos`

### 2.1. Install
```bash 
# git clone this repo
git clone https://github.com/Albert26193/my-dotfiles

# checkout the branch you need
git checkout linux

# cd to this repo
cd ./my-dotfiles/

# run install script
bash ./scripts/install.sh
```
### 2.2 Add new config file
- if new config file is under home directory, just add it to `./dotfiles/home_dotfiles`
- if new config file is under config directory, just add it to `./dotfiles/config_dotfiles`
- finally, run `bash ./scripts/install.sh` to make symbolic link

### 2.3 Automatic backup old config files

- when run `bash ./scripts/install.sh`, it will backup old config files by add a suffix `.backup` to the old config file.
- for example, if you have a `.vimrc` file, it will be backup to `.vimrc.bakcup`

## 3.Todo
- [ ] add a script to install all the software I need
- [ ] add a script to install all the fonts I need
- [ ] add a script to remove all unused backup files