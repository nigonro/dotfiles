# prompt
GIT_PROMPT_THEME=nigonro

if [ -f "/usr/local/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  __GIT_PROMPT_DIR="/usr/local/opt/bash-git-prompt/share"
  source "/usr/local/opt/bash-git-prompt/share/gitprompt.sh"
fi

# some useful aliases
alias ll='ls -lhG'
alias lh='ls -ld .??*'
alias la='ls -lhGA'
alias vi='vim'
alias bc='bc -q -l'
alias less='less -X'
alias grep='grep --color=auto'

# file find:
alias ff='find . -type f -name '

# "que pasa" (an old friend said this a lot):
alias qp='ps auxwww | more'

# colored man pages
man() {
    env \
    LESS_TERMCAP_mb=$'\e[01;31m' \
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    man "$@"
  }

  # bash completion for Concourse CLI

_fly-cli() {
    # All arguments except the first one
    args=("${COMP_WORDS[@]:1:$COMP_CWORD}")
    # Only split on newlines
    local IFS=$'\n'
    # Call completion (note that the first element of COMP_WORDS is
    # the executable itself)
    COMPREPLY=($(GO_FLAGS_COMPLETION=1 ${COMP_WORDS[0]} "${args[@]}"))
    return 0
}

complete -F _fly-cli fly

# default editor setup
export EDITOR=vim

# go setup
export GOPATH=$HOME/code/go
export PATH=$PATH:$GOPATH/bin
export CDPATH=.:$GOPATH/src/github.com/vwdilab:$GOPATH/src/github.com/$USER

got() {
    if [ -d "vendor" ]; then
        GOT_OUTPUT=`go test -v $(go list ./... | grep -v /vendor/)`
    else
        GOT_OUTPUT=`go test -v ./...`
    fi
    GOT_OUTPUT=`echo "$GOT_OUTPUT" | sed /RUN/d`
    GOT_OUTPUT=`echo "$GOT_OUTPUT" | sed s/PASS/$(printf "\033[32mPASS\033[0m")/g`
    GOT_OUTPUT=`echo "$GOT_OUTPUT" | sed s/FAIL/$(printf "\033[31mFAIL\033[0m")/g`
    echo "$GOT_OUTPUT"
}

# android
export REPO_OS_OVERRIDE="macosx"

# flutter
export PATH=$PATH:/usr/local/flutter/bin

