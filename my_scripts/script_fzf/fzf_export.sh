#!/bin/bash

# for fzf_jump
# change your dir here
jump_root_dirs=(
    "${HOME}/CodeSpace/"
    "${HOME}/.config/"
    "${HOME}/.ssh/"
)

jump_ignore_dirs=(
    "node_modules"
    ".git"
    "dist"
    ".cache"
    "voice-print"
    "lodash"
    "from_github"
    "assets"
    "image"
    "images"
    "static"
    "data"
)

# for fzf_edit
# TODO
#edit_root_dirs=(
#    "/Users/albert/CodeSpace/"
#    "/Users/albert/.config/"
#)
#
#edit_ignore_dirs=(
#    "node_modules"
#    ".git"
#    "dist"
#    ".cache"
#    "voice-print"
#    "lodash"
#    "from_github"
#    "assets"
#    "image"
#    "images"
#    "static"
#    "data"
#)
