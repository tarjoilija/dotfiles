# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# minimal theme
ZSH_THEME="arrow"

plugins=(git npm pip command-not-found sudo zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# own scripts
export PATH="~/bin:${PATH}"
