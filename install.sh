#!/bin/bash

# installer script for dotfiles
# basically just create symlinks to each file
# in the home directory

if [ $# -eq 1 ]; then
    #doing remote install
   copy_cmd="copy_remote"
   link_cmd="link_remote"
else
   copy_cmd="copy_local"
   link_cmd="link_local"
fi
git submodule update --init
server=$1
function copy_remote(){
    rsync -a --exclude=".git" "$1" "$server:~/"
}
function link_remote(){
    echo "Copyiing $1 to $server:$2"
    rsync -a --exclude=".git" "$1" "$server:$2"
}
function link_local() {
    ln -s "$1" "$2"
}
function copy_local(){
    if [ $(uname) == "Darwin" ]; then
        cp -fRv "$1" "$2"
    elif [ $(uname) == "FreeBSD" ]; then
        cd "$2"
        cp -lfRv "$1" "$2/"
    else
        dir=$PWD
        cd "$2"
        cp -sfRv "$1" "./"
        cd $PWD
    fi
}

abspath="$(cd "${0%/*}" 2>/dev/null; echo "$PWD"/"${0##*/}")"
current_dir=`dirname "$abspath"`

function rm_bundle(){
    dest_path="$HOME/.vim/bundle/$1"
    rm -f $dest_path
}

function go_install() {
    export GOPATH=$HOME
    echo "installing $1"
    go get -u $1
    go install $1
}


if [ ! -e  "$HOME/.oh-my-zsh" ]; then
    $link_cmd "$current_dir/oh-my-zsh" "$HOME/.oh-my-zsh"
fi
if [ ! -e  "$HOME/.oh-my-zsh-custom" ]; then
    $link_cmd "$current_dir/oh-my-zsh-custom" "$HOME/.oh-my-zsh-custom"
fi

if [ -d "$HOME/.emacs.d" ]; then
    dir=$(mktemp -d "$HOME/.emacs.d.XXXX")
    mv $HOME/.emacs.d $dir
fi

$link_cmd "$current_dir/spacemacs" "$HOME/.emacs.d"
$copy_cmd "$current_dir/dotfiles/.emacs.d/private" "$HOME/.emacs.d/"

function install_from_remote() {
    fname=$(mktemp "remote_installer.XXXXX")
    curl -o $fname "$2"
    if [ $? -eq 0 ]; then 
        sha=$(shasum -a 256 $fname | awk '{print $1}')
        if [ "$sha" == "$1" ]; then
          /bin/bash $fname
          if [ -f $fname ]; then
            rm $fname
          fi
        else 
            echo "File $2 ($fname) did not have expected sha256:  got: $sha   wanted: $1"
            return
        fi
    else
        echo "Failed to download $2"
    fi
}

install_from_remote 175001b095420d65c2bf0d9efe57372ab2d9082b66f8c6bfc220c1b9578f86a0 https://spacevim.org/install.sh

if [ "$link_cmd" == "link_remote" ]; then
    $link_cmd "$current_dir/oh-my-zsh/" "$HOME/.oh-my-zsh"
    $link_cmd "$current_dir/oh-my-zsh-custom/" "$HOME/.oh-my-zsh-custom"
    $link_cmd "$current_dir/colors/" "$HOME/.colors"
fi

if [ "x$link_cmd" == "link_local" ]; then
    echo "Installing go libs..."
  go_install github.com/davidrjenni/reftools/cmd/fillstruct
  go_install github.com/davidrjenni/reftools/cmd/fillswitch
  go_install github.com/davidrjenni/reftools/cmd/fixplurals
  go_install golang.org/x/tools/cmd/goimports 
  go_install golang.org/x/tools/cmd/gorename 
  go_install golang.org/x/tools/cmd/guru 
  go_install github.com/cweill/gotests/... &
  go_install github.com/josharian/impl &
  go_install github.com/mdempsky/gocode &
  go_install github.com/rogpeppe/godef &
  go_install github.com/zmb3/gogetdoc &
  go_install github.com/fatih/gomodifytags &
  go_install github.com/haya14busa/gopkgs/cmd/gopkgs &
fi

for file in $(find "$current_dir/dotfiles/" -maxdepth 1); do
    if [ "$current_dir/dotfiles/" != "$file" ]; then
        $copy_cmd "$file" "$HOME"
    fi
done

grep "jp_zshrc" $HOME/.zshrc >/dev/null 2>&1|| \ cat <<EOF >> $HOME/.zshrc

if [ -e $HOME/.zsh/jp_zshrc ]; then
    source $HOME/.zsh/jp_zshrc
fi
EOF

grep "jp_bashrc" $HOME/.bashrc >/dev/null 2>&1 || \ cat <<EOF >> $HOME/.bashrc

if [ -e $HOME/.bash/jp_bashrc ]; then
    source $HOME/.bash/jp_bashrc
fi
EOF
