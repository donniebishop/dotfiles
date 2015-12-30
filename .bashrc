#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# default bash PS1
PS1='\u@\h \W \$ '

# my PS1
# PS1='\[\e[4;36m\]\u\[\e[m\]\[\e[4;36m\]@\h\[\e[m\] \[\e[0;37m\]\W\[\e[m\] \[\e[1;35m\]\$\[\e[m\] \[\e[0;37m\]'

# use vim as editor
export VISUAL="vim"
export EDITOR="$VISUAL"

# python virtualenvwrapper
export WORKON_HOME="~/.venvs"
source /usr/bin/virtualenvwrapper.sh

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

# systemd things
if [[ -x /usr/bin/journalctl ]]
then   
    alias searchlogs='journalctl -b --no-pager | grep'
fi

# package manager aliases
# ARCH - Pacman
if [[ -x /usr/bin/pacman ]]
then
    alias supacins='sudo pacman -S '
    alias supacupd='sudo pacman -Syyu'
    alias pacsearch='pacman -Ss '

    # Yaourt aliases, if installed
    if [[ -x /usr/bin/yaourt ]]
    then
        alias yaouins='yaourt -S '
        alias yaoupdate='yaourt -Syu --aur'
        alias aursearch='yaourt -Ss '
    fi

    # makepkg alias, for better everything
    if [[ -x /usr/bin/makepkg ]]
    then
        alias makepkg='makepkg -sri'
    fi
fi

# RHEL/CentOS - Yum
if [[ -x /usr/bin/yum ]]
then
    alias suyumins='sudo yum install '
fi

# git aliases
alias gstat='git status '
alias gadd='git add '
alias gcommit='git commit '
alias gclone='git clone '
alias gpull='git pull '
alias gpush='git push '

# random things
alias sudo='sudo '
alias symlink='sudo ln -s'
alias i3config='vim ~/.config/i3/config'
alias xrdbreload='xrdb ~/.Xresources'
alias vixres='vim ~/.Xresources'

