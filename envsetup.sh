#!/bin/bash

set -o vi

envsetup=~/.envsetup
envsetup_sh=$envsetup/envsetup.sh
devsetup_sh=$envsetup/devsetup.sh
pathsetup_sh=$envsetup/pathsetup.sh
alias cdenvsetup='cd $envsetup'
alias s.envsetup='source $envsetup_sh'
alias s.devsetup='source $devsetup_sh'
alias s.pathsetup='source $pathsetup_sh'
alias vienvsetup='vim $envsetup_sh'
alias videvsetup='vim $devsetup_sh'
alias vipathsetup='vim $pathsetup_sh'

vimrc=$envsetup/.vimrc
gitconfig=$envsetup/.gitconfig
alias ln.vimrc='ln -s $vimrc .vimrc'
alias ln.gitconfig='ln -s $gitconfig .gitconfig'
alias vivimrc='vim $vimrc'
alias vigitconfig='vim $gitconfig'

alias e='exit'

#alias ls='ls --color=auto'
alias ll='ls -alh'
alias llr='ls -alRh'
alias cd..='cd ..'
alias df='df -h'
alias du.1depth='du --max-depth=1 -h'
alias du.2depth='du --max-depth=2 -h'
alias du.3depth='du --max-depth=3 -h'
alias du.4depth='du --max-depth=4 -h'
alias tree.1depth='tree -L 1'
alias tree.2depth='tree -L 2'
alias tree.3depth='tree -L 3'
alias tree.4depth='tree -L 4'

echo ~/.envsetup/envsetup.sh sourced!!!
