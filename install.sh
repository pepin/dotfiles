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
done;
