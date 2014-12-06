#!/bin/bash
set -e
set -u

__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

make_link() {
    file="${1}"
    link="${HOME}/${file}"

    if [[ -f "${link}" || -d "${link}" ]]; then
        echo "move ${file} to ${file}.backup"
        mv "${link}" "${link}.backup"
    fi

    echo "symlink ${file} to ${__dir}/${file}"
    ln -s "${__dir}/${file}" "${link}"
}

dotfiles=(
    .bash_git
    .bashrc
    .cshrc
    .gitconfig
    .i3
    .inputrc
    .pentadactylrc
    .tmux.conf
    .vimperatorrc
    .vimrc
    .Xdefaults
    .Xresources
    .Xmodmap
    .zshrc
)

for file in "${dotfiles[@]}"; do
    make_link "${file}"
done
