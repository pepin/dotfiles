#!/bin/bash
# installer script for dotfiles
# basically just create symlinks to each file
# in the home directory

if [ $# -eq 1 ]; then
    #doing remote install
   copy_cmd="copy_remote"
else
   copy_cmd="copy_local"
fi
server=$1
function copy_remote(){
    rsync -a --exclude=".git" "$1" "$server:~/"
}
function copy_local(){
    if [ $(uname) == "Darwin" ]; then
        cp -fRv "$1" "$2"
    else
        cd "$2"
        cp -sfRv "$1" "$2/"
    fi
}

abspath="$(cd "${0%/*}" 2>/dev/null; echo "$PWD"/"${0##*/}")"
current_dir=`dirname "$abspath"`

for file in $(find "$current_dir/dotfiles/" -maxdepth 1); do
    if [ "$current_dir/dotfiles/" != "$file" ]; then
        $copy_cmd "$file" "$HOME"
    fi
done

function add_bundle(){
    abspath="$(cd "${0%/*}" 2>/dev/null; echo "$PWD"/"${0##*/}")"
    current_dir=`dirname "$abspath"`
    dest_path="$HOME/.vim/bundle/$1"
    source_path="$current_dir/vim-bundles/$1"
    mkdir -p ~/.vim/bundle
    if [ -e "$dest_path" ]; then
        echo "Bundle $1 already exists."
    elif [ -d "$source_path" ]; then
        echo "Creating link to $dest_path from $source_path"
        ln -s "$source_path" "$dest_path"
    else
        echo "Could not add bundle '$1', was not found in '$current_dir/vim-bundles/'"
    fi
}

add_bundle "nerdtree"
