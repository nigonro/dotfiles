# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# TMUX
if which tmux >/dev/null 2>&1; then
    # if no session is started, start a new session
    test -z ${TMUX} && tmux

    # when quitting tmux, try to attach
    while test -z ${TMUX}; do
        tmux attach || break
    done
fi

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

export LANG=en_US.UTF-8

# local bins
export PATH=$PATH:$HOME/.bin

# prompt
GIT_PROMPT_ONLY_IN_REPO=0
GIT_PROMPT_THEME="Custom"
source ~/.bash-git-prompt/gitprompt.sh

# some useful aliases
alias ls='ls --color=auto'
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
export EDITOR=nvim

# go setup
export GOPATH=$HOME/code/go
alias gop='export GOPATH=$GOPATH:$(pwd | awk -F"src" "{print \$1}"); echo "set GOPATH to $GOPATH"'
export PATH=$PATH:$GOPATH/bin
export CDPATH=.:$HOME/code:$GOPATH/src/github.com/nigonro:$GOPATH/src/github.com/vwdilab

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

# node modules
export PATH=$PATH:$HOME/.node_modules/bin

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#Xtensa toolchain for ESP8266
export PATH=/home/nigonro/code/esp/esp-open-sdk/xtensa-lx106-elf/bin:$PATH

# aws cli
complete -C '/usr/bin/aws_completer' aws

# X clipboard
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
