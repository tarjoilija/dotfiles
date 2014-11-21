# globals
export PATH="~/bin:${PATH}"
export EDITOR=vim

# load zgen
source "${HOME}/proj/zgen/zgen.zsh"

# check if there's no init script
if ! zgen saved; then
    echo "creating a zgen save"

    zgen oh-my-zsh

    # plugins
    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/npm
    zgen oh-my-zsh plugins/pip
    zgen oh-my-zsh plugins/command-not-found
    zgen oh-my-zsh plugins/sudo
    zgen load zsh-users/zsh-syntax-highlighting

    # theme
    zgen oh-my-zsh themes/arrow

    # save all to init script
    zgen save
fi
