set prompt="%{\e[31;1m%}%n@%m %{\e[34m%}%~ %{\e[37;0m%}\%%{\e[0m%} "

if (-r /usr/bin/dircolors) then
    alias ls 'ls --color=auto'

    alias grep 'grep --color=auto'
    alias fgrep 'fgrep --color=auto'
    alias egrep 'egrep --color=auto'
endif

# aliases
alias ll 'ls -alF'
alias fn 'find . -name '

# env
setenv EDITOR vim

if (-r ~/.csh_local) then
    source ~/.csh_local
endif

