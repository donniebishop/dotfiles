#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# default bash PS1
#PS1='\u@\h \W \$ '

# custom PS1
#PS1='\u@\h \W \[\e[1;35m\]\$\[\e[m\] '
# minimal PS1
PS1='\W \[\e[1;32m\]\$\[\e[m\] '

# use vim as editor
if [[ -x /usr/bin/vim ]]
then
    export VISUAL="vim"
    export EDITOR=$VISUAL
fi

# python virtualenvwrapper
export WORKON_HOME="~/.venvs"
source /usr/bin/virtualenvwrapper.sh

# ls aliases
alias ls='ls --color=auto'
alias lsa='ls -A --color=auto'
alias lsl='ls -lh --color=auto'
alias lsla='ls -Alh --color=auto'
alias lso='ls -A | grep --color=auto'
alias lsr='ls -R'
alias lslr='ls -lR'
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

# package manager helpers
# ARCH - Pacman
if [[ -x /usr/bin/pacman ]]
then
    alias supacins='sudo pacman -S '
    alias supacrem='sudo pacman -R '
    alias supacupd='sudo pacman -Syu'
    alias supacclean='sudo pacman -Sc'
    alias pacsearch='pacman -Ss '
    alias pacinfo='pacman -Si '

    # Yaourt aliases, if installed
    if [[ -x /usr/bin/yaourt ]]
    then
        alias yaouins='yaourt -S '
        alias yaourem='yaourt -R '
        alias yaoupd='yaourt -Syu --aur'
        alias pacsearch='yaourt -Ss '
        alias pacinfo='yaourt -Si '
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
    alias suyumrem='sudo yum remove '
    alias suyumgins='sudo yum groupinstall '
    alias suyumgrem='sudo yum groupremove '
    alias suyumclean='sudo yum clean all'
fi

# git aliases
alias gstat='git status '
alias gadd='git add '
alias gcommit='git commit '
alias gclone='git clone '
alias gpull='git pull '
alias gpush='git push '
alias glog='git log -3'

# /r/unixporn related
alias i3config='vim ~/.config/i3/config'
alias vixres='vim ~/.Xresources'
alias xrdbreload='xrdb ~/.Xresources'

# random things
alias sudo='sudo '
alias symlink='sudo ln -s'
alias wtfis='whatis '
alias chkexit='echo $?'
alias feh='feh --geometry 900x600'
