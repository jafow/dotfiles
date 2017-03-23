#!/usr/bin/env bash

# Get current dir (so run this script from anywhere)

export DOTFILES_DIR EXTRA_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
BUNDLE_DIR=~/.vim/bundle

# Update dotfiles itself first

# [ -d "$DOTFILES_DIR/.git" ] && git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master

# make .vim and bundle
mkdir -p "$BUNDLE_DIR"

# Bunch of symlinks
ln -sfv "$DOTFILES_DIR/.bash_profile" ~
ln -sfv "$DOTFILES_DIR/.inputrc" ~
ln -sfv "$DOTFILES_DIR/.gitconfig" ~
ln -sfv "$DOTFILES_DIR/.gitignore_global" ~
ln -sfv "$DOTFILES_DIR/.git-prompt.sh" ~
ln -sfv "$DOTFILES_DIR/.tmux.conf" ~
ln -sfv "$DOTFILES_DIR/bin" ~
ln -sfv "$DOTFILES_DIR/.vimrc" ~
ln -sfv "$DOTFILES_DIR/.vim" ~

# Package managers & packages

. "$DOTFILES_DIR/npm.sh"

if [ "$(uname)" == "Darwin" ]; then
    . "$DOTFILES_DIR/install/brew-cask.sh"
    . "$DOTFILES_DIR/install/gem.sh"
        ln -sfv "$DOTFILES_DIR/etc/mackup/.mackup.cfg" ~
fi

# copy over plugins
cp -r "$DOTFILES_DIR/.vim" "$HOME"

