#!/bin/bash

set -o vi

alias cdenvsetup='cd ~/.envsetup'

envsetup=~/.envsetup/envsetup.sh
devsetup=~/.envsetup/devsetup.sh
pathsetup=~/.envsetup/pathsetup.sh
alias source.envsetup='source $envsetup'
alias source.devsetup='source $devsetup'
alias source.pathsetup='source $pathsetup'
alias vienvsetup='vim $envsetup'
alias videvsetup='vim $devsetup'
alias vipathsetup='vim $pathsetup'

vimrc=~/.envsetup/.vimrc
gitconfig=~/.envsetup/.gitconfig
alias ln.vimrc='ln -s $vimrc .vimrc'
alias ln.gitconfig='ln -s $gitconfig .gitconfig'
alias vivimrc='vim $vimrc'
alias vigitconfig='vim $gitconfig'

alias e='exit'

alias ls='ls --color=auto'
alias ll='ls -alh'
alias llr='ls -alRh'
alias cd..='cd ..'

alias checkver1='apt-cache policy'
alias checkver2='apt-cache show'
alias checkver3='apt-cache showpkg'
alias checkver4='dpkg -s'
alias checkver5=''

alias n='nautilus .'
alias ffplay='ffplay -autoexit'
alias ff='ffplay -autoexit'
alias play='ffplay -autoexit'

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
