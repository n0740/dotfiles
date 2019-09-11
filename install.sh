#!/usr/bin/env bash

clear
echo "      _       _    __ _ _             "
echo "     | |     | |  / _(_) |            "
echo "   __| | ___ | |_| |_ _| | ___  ___   "
echo "  / _\` |/ _ \| __|  _| | |/ _ \/ __|  "
echo " | (_| | (_) | |_| | | | |  __/\__ \  "
echo "(_)__,_|\___/ \__|_| |_|_|\___||___/  "
echo "______________________________________________"
echo
echo "Installing dotfiles into home directory"
echo

BACKUP_DIR="dotfiles.backup"
SKIP_FILES_REGEXP="\.(sh|md|txt)$|^vim$"


echo "Creating dotfiles"
for name in *; do
    target="$HOME/.$name"

    if [[ ! $name =~ $SKIP_FILES_REGEXP ]]; then
        # Check if file already exists
        if [ -e "$target" ]; then
            # Check if file is a symlink:
            #  - if it is symlink we just delete it
            #  - if it's a real file we back it up
            if [ ! -L "$target" ]; then
                # Create backup dir if it's not there
                if [ ! -d "$HOME/$BACKUP_DIR" ]; then
                    mkdir -p "$HOME/$BACKUP_DIR"
                fi
                echo "Backing up .$name in $HOME/$BACKUP_DIR/ directory"
                cp "$target" "$HOME/$BACKUP_DIR/.$name"
            fi
            rm -rf "$target"
        fi

        echo "Creating .$name"
        ln -s "$PWD/$name" "$target"
    fi
done


echo "Installing Vim plugins"
mkdir -p ~/.vim/bundle/
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall


echo "Installing tmux tpm plugin"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm


echo "Installing fonts"
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts
