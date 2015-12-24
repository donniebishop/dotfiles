#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# default bash PS1
PS1='\u@\h \W \$ '

# ls aliases
alias ls='ls --color=auto'
alias lsa='ls -A --color=auto'
alias lsl='ls -lh --color=auto'
alias lsla='ls -Alh --color=auto'
alias lso='ls -A | grep --color=auto'
alias lsd='ls -d */'
alias lsld='ls -dl */'
alias lslo='ls -Alh | grep --color=auto'
alias lsonly='ls -A | grep --color=auto'
alias lslonly='ls -Alh | grep --color=auto'

# package manager aliases
# ARCH
if [[ -x /usr/bin/pacman ]]
then
    alias supacins='sudo pacman -S '
    alias supacupd='sudo pacman -Syyu'
fi

# git aliases
alias gstat='git status '
alias gadd='git add '
alias gcommit='git commit '
alias gclone='git clone '
alias gpull='git pull '
alias gpush='git push '

# random aliases
alias sudo='sudo '
alias i3config='vim ~/.config/i3/config'
alias makepkg='makepkg -sri'
alias xrdbreload='xrdb ~/.Xresources'
alias searchlogs='journalctl -b --no-pager | grep'

# python virtualenvwrapper
#export WORKON_HOME=~/.venvs
#source /usr/bin/virtualenvwrapper.sh

