#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
# default bash PS1
PS1='\u@\h \W \$ '

# my PS1
# PS1='\[\e[4;36m\]\u\[\e[m\]\[\e[4;36m\]@\h\[\e[m\] \[\e[0;37m\]\W\[\e[m\] \[\e[1;35m\]\$\[\e[m\] \[\e[0;37m\]'

# python virtualenvwrapper
export WORKON_HOME=~/.venvs
source /usr/bin/virtualenvwrapper.sh

# aliases
alias i3config='vim ~/.config/i3/config'
alias makepkg='makepkg -sri'
alias xrdbreload='xrdb ~/.Xresources'

