# globals
export PATH="~/bin:${PATH}"
export EDITOR=vim

# zgen this gen
source "${HOME}/proj/zgen/zgen.zsh"

if [[ ! -f "${ZGEN_INIT}" ]]; then
    echo "creating new zgen init script"

    # oh-my-zsh
    zgen-load-oh-my-zsh

    # plugins
    zgen-load zsh-users/zsh-syntax-highlighting zsh-syntax-highlighting.zsh
    zgen-load robbyrussell/oh-my-zsh plugins/git/git.plugin.zsh
    zgen-load robbyrussell/oh-my-zsh plugins/npm/npm.plugin.zsh
    zgen-load robbyrussell/oh-my-zsh plugins/pip/pip.plugin.zsh
    zgen-load robbyrussell/oh-my-zsh plugins/command-not-found/command-not-found.plugin.zsh
    zgen-load robbyrussell/oh-my-zsh plugins/sudo/sudo.plugin.zsh

    # theme
    zgen-load robbyrussell/oh-my-zsh themes/arrow.zsh-theme

    # save to init script
    zgen-save
fi
