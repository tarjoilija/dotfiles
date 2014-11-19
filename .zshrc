# path to oh-my-zsh installation
export ZSH=$HOME/.oh-my-zsh

# minimal theme
ZSH_THEME="arrow"

# zsh-syntax-highlighting has to be installed manually
plugins=(git npm pip command-not-found sudo zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# own scripts
export PATH="~/bin:${PATH}"
