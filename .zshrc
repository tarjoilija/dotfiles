# globals
export PATH="~/bin:${PATH}"
export EDITOR=vim

# load zgen
source "${HOME}/proj/zgen/zgen.zsh"

# check if there's an init script
if [[ ! -f "${ZGEN_INIT}" ]]; then
    echo "no init script found; creating one"

    zgen oh-my-zsh

    # plugins
    zgen load robbyrussell/oh-my-zsh plugins/git/git.plugin.zsh
    zgen load robbyrussell/oh-my-zsh plugins/npm/npm.plugin.zsh
    zgen load robbyrussell/oh-my-zsh plugins/pip/pip.plugin.zsh
    zgen load robbyrussell/oh-my-zsh plugins/command-not-found/command-not-found.plugin.zsh
    zgen load robbyrussell/oh-my-zsh plugins/sudo/sudo.plugin.zsh
    zgen load zsh-users/zsh-syntax-highlighting zsh-syntax-highlighting.zsh

    # theme
    zgen load robbyrussell/oh-my-zsh themes/arrow.zsh-theme

    # save all to init script
    zgen save
fi
