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

# ls aliases
alias lsa='ls -A --color=auto'
alias lsl='ls -lh --color=auto'
alias lsla='ls -Alh --color=auto'
alias lso='ls -A | grep --color=auto'
alias lsd='ls -d */'
alias lsld='ls -dl */'
alias lslo='ls -Alh | grep --color=auto'
alias lsonly='ls -A | grep --color=auto'
alias lslonly='ls -Alh | grep --color=auto'

# aliases
alias i3config='vim ~/.config/i3/config'
alias makepkg='makepkg -sri'
alias xrdbreload='xrdb ~/.Xresources'
