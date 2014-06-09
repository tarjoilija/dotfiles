# exit if not interactive mode
[ -z "$PS1" ] && return

# history settings
shopt -s histappend
HISTSIZE=2000
HISTFILESIZE=4000
HISTCONTROL=ignoreboth

# general settings
shopt -s checkwinsize

# lesspipe is better than less
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# useful prompt with title
function _prompt_command () {
    LAST_COMMAND=$?

    BLUE='\[\033[01;34m\]'
    RED='\[\e[01;31m\]'
    GREEN='\[\e[01;32m\]'
    WHITE='\[\e[00;37m\]'
    RESET='\[\e[00m\]'

    PS1="${RED}\u@\h "
    PS1+="${BLUE}\w"
    PS1+="${GREEN}\$(__git_ps1 '(%s)') "

    if [ $LAST_COMMAND -eq 0 ]; then
        PS1+="${WHITE}\$"
    else
        PS1+="${RED}\$"
    fi

    PS1+="${RESET} "

    # set title
    case "$TERM" in
        xterm*|*rxvt*)
            PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
            ;;
        *)
            ;;
    esac
}
PROMPT_COMMAND='_prompt_command'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias fn='find . -name '

# load site specific aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
