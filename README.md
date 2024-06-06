# my dot Files for 

> this repo is a container for my dot files, both on MacOS and ArchLinux 🍺️

> ⚠️ this branch is for **Mac**

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
git checkout mac

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
- these files are under `./files/home_dotfiles`
```shell
# dotfiles under /home/username directory
$ tree -a ./files/home_dotfiles

home_dotfiles
├── .tmux.conf          # tmux config file
├── .vimrc              # vim config file
├── .amethyst.yml       # amethyst config file, amethyst is a tiling window manager for macos
└── .zshrc              # zsh config file with oh-my-zsh
```

| config file   | category | description                    |  website |
| ------------- | -------- | ------------------------------ | ---------------- |
| .tmux.conf       | tmux     | tmux configuration file        | https://github.com/tmux/tmux |
| .vimrc           | vim      | Vim configuration file. I try keep it simple, if you need complex features, use neovim         | https://www.vim.org |
| .amethyst.yml    | wm   | amethyst config files, which is a tiling window manager for macos | https://github.com/ianyh/Amethyst |
| .zshrc           | Zsh      | zsh configuration file with oh-my-zsh | https://ohmyz.sh |

### 1.3 Config files under `/home/username/.config`
- these files are under `./files/config_dotfiles`
```shell
# dotfiles under /home/username/.config directory
$ tree -a ./files/config_dotfiles

config_dotfiles
└── alacritty.yml # alacritty config file, which is a gpu-accelerated terminal emulator for macOS, Linux and BSD
```

| config file       | category | description                                       | official website                  |
| ----------------- | -------- | ------------------------------------------------- | --------------------------------- |
| alacritty.yml     | Terminal | Alacritty configuration file                       | https://github.com/alacritty/alacritty |

## 2.Usage

> you should check your os version and install the software you need before use this repo

> if you are using linux, checkout the branch `linux`
> if you are using macos, checkout the branch `macos`, current branch is `macos`

### 2.1. Install
```bash 
# git clone this repo
git clone https://github.com/Albert26193/my-dotfiles

# checkout the branch you need
git checkout mac

# cd to this repo
cd ./my-dotfiles/

# run install script
bash ./scripts/softlink.sh
```
### 2.2 Add new config file
- if new config file is under home directory, just add it to `./files/home_dotfiles`
- if new config file is under config directory, just add it to `./files/config_dotfiles`
- finally, run `bash ./scripts/softlink.sh` to make symbolic link

### 2.3 Automatic backup old config files

- when run `bash ./scripts/softlink.sh`, it will backup old config files by add a suffix `.backup` to the old config file.
- for example, if you have a `.vimrc` file, it will be backup to `.vimrc.bakcup`

## 3.Todo
- [ ] add a script to install all the software I need
- [ ] add a script to install all the fonts I need
- [ ] add a script to remove all unused backup files
